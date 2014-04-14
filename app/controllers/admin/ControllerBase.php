<?php

namespace MyApp\Controllers\Admin;

use Phalcon\Mvc\Controller,
    Phalcon\Tag,
    Phalcon\Mvc\Dispatcher;

class ControllerBase extends Controller{

    public function beforeExecuteRoute(Dispatcher $dispatcher){
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();
        $auth = $this->session->get('auth');

        if($auth){
            if($controller == 'session' && $action == 'index')
                return $this->response->redirect('admin/index');
        }else{
            if($controller != 'session')
                return $this->response->redirect('admin/session');
        }
    }

    protected function initialize(){
        Tag::prependTitle('IFITS - ');
    }

	public function afterExecuteRoute(){
		$this->view->setViewsDir($this->view->getViewsDir() . 'admin/');
	}

}
