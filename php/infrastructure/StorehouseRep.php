<?php

require_once("domain/interfaces/StorehouseRepInterface.php");
require_once("domain/core/Storehouse.php");

class StorehouseRep implements StorehouseRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM storehouse");
        foreach ($res as $row) {
            array_push($arr,Storehouse::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Storehouse
    {
        return Storehouse::fromAssocArray($this->db->readQuery("SELECT * FROM storehouse WHERE id=?","i",$id)[0]);
    }

    public function create(Storehouse $obj): void
    {
        $this->db->writeQuery("INSERT INTO storehouse VALUES(NULL,?,?,?)","ssi",
            $obj->getName(),$obj->getType(),$obj->getDeliveryTime());
    }

    public function update(Storehouse $obj): void
    {
        $this->db->writeQuery("UPDATE storehouse SET name=?,type=?,delivery_time=? WHERE id=?","ssii",
            $obj->getName(),$obj->getType(),$obj->getDeliveryTime(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM storehouse WHERE id=?","i",$id);
    }
}