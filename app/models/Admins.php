<?php

class Admins extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var string
     */
    public $username;
     
    /**
     *
     * @var string
     */
    public $password;
     
    /**
     *
     * @var integer
     */
    public $created_at;
     
    /**
     *
     * @var integer
     */
    public $active;
     
    /**
     * @return Admins[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Admins
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'username' => 'username', 
            'password' => 'password', 
            'created_at' => 'created_at', 
            'active' => 'active'
        );
    }

}
