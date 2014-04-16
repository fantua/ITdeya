<?php




class EventMembers extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var integer
     */
    public $event_id;
     
    /**
     *
     * @var string
     */
    public $data;
     
    /**
     * @return EventMembers[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return EventMembers
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
            'event_id' => 'event_id', 
            'data' => 'data'
        );
    }

    public function initialize()
    {
        $this->belongsTo("event_id", "Events", "id");
    }

    public function afterFetch(){
        $this->data = unserialize(base64_decode($this->data));
    }

}
