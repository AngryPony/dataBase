<?php
require_once("domain/interfaces/OrderRepInterface.php");
require_once("domain/core/Order.php");

class OrderRep implements OrderRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM `order`");
        foreach ($res as $row) {
            array_push($arr,Order::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Order
    {
        return Order::fromAssocArray($this->db->readQuery("SELECT * FROM `order` WHERE id=?","i",$id)[0]);
    }

    public function create(Order $obj): void
    {
        $this->db->writeQuery("INSERT INTO `order` VALUES(NULL,?,?,?,?,?,?,?)","ssisiii",
            $obj->getDeliveryAddress(),$obj->getDateOfCreation()->format("Y-m-d"),$obj->getAmount(),$obj->getStatus(),
        $obj->getPatientId(),$obj->getPharmacyId(),$obj->getTypeId());
    }

    public function update(Order $obj): void
    {
        $this->db->writeQuery("UPDATE `order` SET delivery_address=?,date_of_creation=?,amount=?,status=?,
                 patient_id=?,pharmacy_id=?,type_id=? WHERE id=?","ssisiiii",
            $obj->getDeliveryAddress(),$obj->getDateOfCreation()->format("Y-m-d"),$obj->getAmount(),$obj->getStatus(),
            $obj->getPatientId(),$obj->getPharmacyId(),$obj->getTypeId(),$obj->getId());
    }

    public function getMedicines(int $id) : string{
        return $this->db->readQuery("SELECT get_medicines(?) AS r","i",$id)[0]['r'];

    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM `order` WHERE id=?","i",$id);
    }
}