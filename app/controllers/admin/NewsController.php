<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class NewsController extends ControllerBase{

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

        $news = \News::find();

        $paginator = new Model(array(
            "data" => $news,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("news", $news);

    }

    public function addAction(){

        if($this->request->isPost()){

            $news = new \News();

            $news->name = $this->request->getPost('name', array('string', 'striptags'));
            $news->full_content = $this->request->getPost('full_content');
            $news->preview_content = $this->request->getPost('preview_content');
            $news->date = time();

            if (!$news->save()) {
                foreach ($news->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'news',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Новина додана');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

    }

    public function deleteAction($id){

        $news = \News::findFirstById($id);

        if (!$news) {
            $this->flash->error('Новина не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        if (!$news->delete()) {
            foreach ($news->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        $this->flash->success('Новина видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'news',
            'action' => 'index'
        ));

    }

    public function editAction($id){

        $news = \News::findFirstById($id);

        if (!$news) {
            $this->flash->error('Новина не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $news->name = $this->request->getPost('name', array('string', 'striptags'));
            $news->full_content = $this->request->getPost('full_content');
            $news->preview_content = $this->request->getPost('preview_content');
            $news->date = strtotime($news->date);

            if (!$news->save()) {
                foreach ($news->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'news',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Новина змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));

        }

        $this->view->setVar("news", $news);

    }

}