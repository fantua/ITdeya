<?php
namespace MyApp\Controllers;
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

        $gallery = \Gallery::find(array('order' => 'id DESC'));

        $paginator = new Model(array(
            "data" => $gallery,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("gallery", $gallery);

    }

    public function viewAction($id){
        $gallery = \Gallery::findFirstById($id);

        if (!$gallery) {
            $this->flash->error('Альбом не знайдений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers',
                'controller' => 'gallery',
                'action' => 'index'
            ));
        }

        $dir = __DIR__.'/../../public/img/gallery/'.$gallery->id;

        $files = scandir($dir);

        unset($files[0]);
        unset($files[1]);
        $key = array_search('preview.jpg', $files);
        unset($files[$key]);

        $this->view->setVar("gallery", $gallery);
        $this->view->setVar("files", $files);
        $this->view->setVar("keys", array_keys($files));
    }
}