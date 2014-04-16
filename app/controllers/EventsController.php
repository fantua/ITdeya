<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class EventsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Події');
        parent::initialize();
    }

    public function indexAction(){

        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $events = \Events::find(array(
            'date >= '.time(),
            'order' => 'id'
        ));

        $paginator = new Model(array(
            "data" => $events,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("events", $events);

    }

    public function viewAction($id){
        $events = \Events::findFirstById($id);

        if (!$events) {
            $this->flash->error('Подія не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers',
                'controller' => 'events',
                'action' => 'index'
            ));
        }

        if($this->request->getQuery("reg"))
            $this->view->setVar("reg", true);
        else
            $this->view->setVar("reg", false);

        $this->view->setVar("events", $events);
    }

    public function registerAction($id){
        $this->view->disable();

        if($this->request->isPost()){

            $events = \Events::findFirstById($id);

            if (!$events) {
                $this->flash->error('Подія не знайдена');
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers',
                    'controller' => 'events',
                    'action' => 'index'
                ));
            }

            $arr = [];

            foreach($events->data as $key => $val){
                $arr[$key] = $this->request->getPost('data', array('string', 'striptags'))[$key];
            }

            $member = new \EventMembers();

            $member->event_id = $id;
            $member->data = base64_encode(serialize($arr));

            if (!$member->save()) {
                foreach ($member->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers',
                    'controller' => 'events',
                    'action' => 'index'
                ));
            }

            return $this->response->redirect('events/view/'.$id.'?reg=true');
        }
    }
}