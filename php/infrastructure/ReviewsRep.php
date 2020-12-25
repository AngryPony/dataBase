<?php
require_once("domain/interfaces/ReviewsRepInterface.php");
require_once("domain/core/Reviews.php");

class ReviewsRep implements ReviewsRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM reviews");
        foreach ($res as $row) {
            array_push($arr,Reviews::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Reviews
    {
        return Reviews::fromAssocArray($this->db->readQuery("SELECT * FROM reviews WHERE id=?","i",$id)[0]);
    }

    public function create(Reviews $obj): void
    {
        $this->db->writeQuery("INSERT INTO reviews VALUES(NULL,?,?,?,?,?,?)","sssssi",
            $obj->getQualityOfService(),$obj->getReasonablePrice(),$obj->getDeliverySpeed(),$obj->getDeliveryQuality(),
            $obj->getWishes(),$obj->getPatientId());
    }

    public function update(Reviews $obj): void
    {
        $this->db->writeQuery("UPDATE reviews SET quality_of_service=?,reasonable_price=?,delivery_speed=?,
                  delivery_quality=?,wishes=?,patient_id =? WHERE id=?","sssssii",
            $obj->getQualityOfService(),$obj->getReasonablePrice(),$obj->getDeliverySpeed(),$obj->getDeliveryQuality(),
            $obj->getWishes(),$obj->getPatientId(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM reviews WHERE id=?","i",$id);
    }
}