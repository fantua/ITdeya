<?php
class Elements extends Phalcon\Mvc\User\Component{

    private $_adminHeaderMenu = array(
        'pull-left' => array(
            'news' => array(
                'caption' => 'Новини',
                'action' => 'index'
            ),
            'events' => array(
                'caption' => 'Події',
                'action' => 'index'
            ),
            'gallery' => array(
                'caption' => 'Галерея',
                'action' => 'index'
            )
        ),
        'pull-right' => array(
            'session' => array(
                'caption' => 'Вихід',
                'action' => 'exit'
            )
        )
    );

    private $_headerMenu = array(
        'pull-right' => array(
            'index' => array(
                'caption' => 'Головна',
                'action' => 'index'
            ),
            'news' => array(
                'caption' => 'Новини',
                'action' => 'index'
            ),
            'events' => array(
                'caption' => 'Події',
                'action' => 'index'
            ),
            'gallery' => array(
                'caption' => 'Галерея',
                'action' => 'index'
            ),
            'contacts' => array(
                'caption' => 'Контакти',
                'action' => 'index'
            )
        )
    );

    public function getAdminMenu(){
        $controller = $this->view->getControllerName();

        echo '<ul class="nav navbar-nav">';

        foreach ($this->_adminHeaderMenu['pull-left'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/admin/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';

        echo '<ul class="nav navbar-nav navbar-right">';

        foreach ($this->_adminHeaderMenu['pull-right'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/admin/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';
    }

    public function getMenu(){
        $controller = $this->view->getControllerName();

        echo '<ul class="nav nav-pills pull-right">';

        foreach ($this->_headerMenu['pull-right'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';

    }

    public function getEvents(){
        $events = \Events::find(array(
            'date >= '.time(),
            'order' => 'id'
        ));

        echo '<ol class="list-unstyled" style="text-align: left">';

        foreach ($events as $event){
            echo '<li style="font-size: 18px;"><i class="glyphicon glyphicon-check"></i> <a href="/events/view/'.$event->id.'">'.$event->name.'</a></li>';
        }

        echo '</ol>';
    }

}