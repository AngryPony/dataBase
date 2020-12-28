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

    public function create(Order $obj): int
    {
        $this->db->writeQuery("INSERT INTO `order` VALUES(NULL,?,?,?,?,?,?,?)","ssisiii",
            $obj->getDeliveryAddress(),$obj->getDateOfCreation()->format("Y-m-d"),$obj->getAmount(),$obj->getStatus(),
        $obj->getPatientId(),$obj->getPharmacyId(),$obj->getTypeId());
        return $this->db->insert_id();
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

    public function getAllMedicines(int $id) : array{
        $arr = array();
        $res = $this->db->readQuery("SELECT medicine.* FROM order_has_medicine JOIN medicine ON 
        medicine.id=order_has_medicine.medicine_id WHERE order_id=?","i",$id);
        foreach ($res as $row) {
            array_push($arr,Medicine::fromAssocArray($row));
        }
        return $arr;
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM `order` WHERE id=?","i",$id);
    }

    public function getMonthTotalAmount() : int{
        return $this->db->readQuery("select sum(amount) as r from `order`
    where curdate() >= `order`.`date_of_creation` and curdate() <= date_add(`order`.`date_of_creation`, interval 1 month);")[0]['r'];
    }
    public function getAveragePrice():int{
        return $this->db->readQuery("select avg(amount * medicine.price) as r from `order`, medicine
    where curdate() > `order`.date_of_creation and curdate() < date_add(`order`.date_of_creation, interval 1 month);")[0]['r'];
    }

    public function addMedicine(int $order_id,int $medicineId) : void{
        $this->db->writeQuery("INSERT INTO order_has_medicine VALUES(NULL,?,?)","ii",$order_id,$medicineId);
    }

    public function removeMedicines(int $id) : void{
        $this->db->writeQuery("DELETE FROM order_has_medicine WHERE order_id=?","i",$id);
    }
}