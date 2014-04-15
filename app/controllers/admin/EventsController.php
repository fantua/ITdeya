<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class EventsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Новини');
        parent::initialize();
    }

    public function indexAction(){

        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $events = \Events::find();

        $paginator = new Model(array(
            "data" => $events,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("events", $events);

    }

    public function addAction(){

        if($this->request->isPost()){

            $events = new \Events();

            $events->name = $this->request->getPost('name', array('string', 'striptags'));
            $events->full_content = $this->request->getPost('full_content');
            $events->preview_content = $this->request->getPost('preview_content');
            $events->date = strtotime($this->request->getPost('date'));
            $events->place = $this->request->getPost('pac-input', array('string', 'striptags'));
            $data = $this->request->getPost('data');

            $arr = [];

            foreach ($data  as $val){
                $arr[] = [
                    'name' => strip_tags($val['name']),
                    'type' => strip_tags($val['type']),
                    'required' => (empty($val['required']))?false:true,
                ];
            }

            $events->data = base64_encode(serialize($arr));

            if (!$events->save()) {
                foreach ($events->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'events',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Подія додана');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'events',
                'action' => 'index'
            ));
        }

    }

    public function deleteAction($id){

        $events = \Events::findFirstById($id);

        if (!$events) {
            $this->flash->error('Подія не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'events',
                'action' => 'index'
            ));
        }

        if (!$events->delete()) {
            foreach ($events->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'events',
                'action' => 'index'
            ));
        }

        $this->flash->success('Подія видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'events',
            'action' => 'index'
        ));

    }

    public function editAction($id){

        $events = \Events::findFirstById($id);

        if (!$events) {
            $this->flash->error('Подія не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'events',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $events->name = $this->request->getPost('name', array('string', 'striptags'));
            $events->full_content = $this->request->getPost('full_content');
            $events->preview_content = $this->request->getPost('preview_content');
            $events->date = strtotime($this->request->getPost('date'));
            $events->place = $this->request->getPost('pac-input', array('string', 'striptags'));
            $data = $this->request->getPost('data');

            $arr = [];

            foreach ($data  as $val){
                $arr[] = [
                    'name' => strip_tags($val['name']),
                    'type' => strip_tags($val['type']),
                    'required' => (empty($val['required']))?false:true,
                ];
            }

            $events->data = base64_encode(serialize($arr));

            if (!$events->save()) {
                foreach ($events->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'events',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Подія змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'events',
                'action' => 'index'
            ));

        }

        $events->date = strftime('%Y-%m-%dT%H:%M:%S', strtotime($events->date));

        $this->view->setVar("events", $events);

    }

}