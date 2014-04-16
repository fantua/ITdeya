<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class IndexController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Головна');
        parent::initialize();
    }

    public function indexAction(){

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $news = \News::find(array('order' => 'id DESC'));

        $paginator = new Model(array(
            "data" => $news,
            "limit" => 5,
            "page" => 1
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("news", $news);

    }
}