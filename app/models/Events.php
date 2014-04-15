<?php

class Events extends \Phalcon\Mvc\Model
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
    public $name;
     
    /**
     *
     * @var string
     */
    public $preview_content;
     
    /**
     *
     * @var string
     */
    public $full_content;
     
    /**
     *
     * @var string
     */
    public $place;
     
    /**
     *
     * @var string
     */
    public $data;
     
    /**
     *
     * @var integer
     */
    public $date;
     
    /**
     * @return Events[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Events
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
            'name' => 'name', 
            'preview_content' => 'preview_content', 
            'full_content' => 'full_content', 
            'place' => 'place', 
            'data' => 'data', 
            'date' => 'date'
        );
    }

    public function afterFetch(){
        $this->date = date('d-m-Y H:i', $this->date);
        $this->data = unserialize(base64_decode($this->data));
    }

}
