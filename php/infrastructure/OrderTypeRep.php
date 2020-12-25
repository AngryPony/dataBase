<?php

require_once("domain/interfaces/OrderTypeRepInterface.php");
require_once("domain/core/OrderType.php");
class OrderTypeRep implements OrderTypeRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM order_type");
        foreach ($res as $row) {
            array_push($arr,OrderType::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): OrderType
    {
        return OrderType::fromAssocArray($this->db->readQuery("SELECT * FROM order_type WHERE id=?","i",$id)[0]);
    }

    public function create(OrderType $obj): void
    {
        $this->db->writeQuery("INSERT INTO order_type VALUES(NULL,?,?)","si",
            $obj->getName(),$obj->getPrice());
    }

    public function update(OrderType $obj): void
    {
        $this->db->writeQuery("UPDATE order_type SET name=?,price=? WHERE id=?","sii",
            $obj->getName(),$obj->getPrice(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM order_type WHERE id=?","i",$id);
    }
}