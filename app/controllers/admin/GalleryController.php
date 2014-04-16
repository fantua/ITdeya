<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class GalleryController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Галерея');
        parent::initialize();
    }

    public function indexAction(){

        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $gallery = \Gallery::find();

        $paginator = new Model(array(
            "data" => $gallery,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("gallery", $gallery);

    }

    public function addAction(){

        if($this->request->isPost()){

            $gallery = new \Gallery();

            $gallery->name = $this->request->getPost('name', array('string', 'striptags'));
            $gallery->description = $this->request->getPost('description');

            if (!$gallery->save()) {
                foreach ($gallery->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'gallery',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Альбом доданий');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'gallery',
                'action' => 'index'
            ));
        }

    }

    public function deleteAction($id){

        $gallery = \Gallery::findFirstById($id);

        if (!$gallery) {
            $this->flash->error('Альбом не знайдений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'gallery',
                'action' => 'index'
            ));
        }

        if (!$gallery->delete()) {
            foreach ($gallery->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'gallery',
                'action' => 'index'
            ));
        }

        $this->flash->success('Альбом видалений');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'gallery',
            'action' => 'index'
        ));

    }

    public function editAction($id){

        $gallery = \Gallery::findFirstById($id);

        if (!$gallery) {
            $this->flash->error('Альбом не знайдений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'gallery',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $gallery->name = $this->request->getPost('name', array('string', 'striptags'));
            $gallery->description = $this->request->getPost('description');

            if (!$gallery->save()) {
                foreach ($gallery->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'gallery',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Альбом змінений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'gallery',
                'action' => 'index'
            ));

        }

        $this->view->setVar("gallery", $gallery);

    }

}