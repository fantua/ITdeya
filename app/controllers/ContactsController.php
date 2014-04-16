<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class ContactsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Контакти');
        parent::initialize();
    }

    public function indexAction(){

    }
}