<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class SessionController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('session');
        Tag::setTitle('Авторизація');
        parent::initialize();
    }

    public function indexAction(){

        if($this->request->isPost()){

            $username = $this->request->getPost('username');
            $password = sha1($this->request->getPost('password'));

            $user = \Admins::findFirst("username='$username' AND password='$password' AND active='1'");

            if ($user != false) {
                $this->_registerSession($user);
                return $this->response->redirect('admin/index');
            }

            $this->flash->error('Логін або пароль введено невірно');
        }

    }

    public function exitAction(){
        $this->session->remove('auth');
        return $this->response->redirect('admin/session');
    }

    private function _registerSession($user){
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->username,
        ));
    }

}