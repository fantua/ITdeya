<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class NewsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Новини');
        parent::initialize();
    }

    public function indexAction(){



    }

}