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

}