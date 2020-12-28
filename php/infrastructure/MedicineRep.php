<?php
require_once("domain/interfaces/MedicineRepInterface.php");
require_once("domain/core/Medicine.php");

class MedicineRep implements MedicineRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM medicine");
        foreach ($res as $row) {
            array_push($arr,Medicine::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Medicine
    {
        return Medicine::fromAssocArray($this->db->readQuery("SELECT * FROM medicine WHERE id=?","i",$id)[0]);
    }

    public function create(Medicine $obj): void
    {
        $this->db->writeQuery("INSERT INTO medicine VALUES(NULL,?,?,?,?,?,?,?)","sssssii",
            $obj->getType(),$obj->getWayOfUsing(),$obj->getName(),$obj->getProvider(),$obj->getDispensingMethod(),
        $obj->getPrice(),$obj->getCriticalLimits());
    }

    public function update(Medicine $obj): void
    {
        $this->db->writeQuery("UPDATE medicine SET `type`=?,way_of_using=?,name=?,provider=?,dispensing_method=?,
                   price=?,critical_limits=? WHERE id=?","sssssiii",
            $obj->getType(),$obj->getWayOfUsing(),$obj->getName(),$obj->getProvider(),$obj->getDispensingMethod(),
            $obj->getPrice(),$obj->getCriticalLimits(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM medicine WHERE id=?","i",$id);
    }

    public function getMostPopular(int $count) : array{
        $arr = array();
        $res = $this->db->readQuery("select medicine.*
    from `order`, medicine
    where pharmacy_id = medicine.id
    group by pharmacy_id
    order by count(*) desc
		limit ?;","i",$count);
        foreach ($res as $row) {
            array_push($arr,Medicine::fromAssocArray($row));
        }
        return $arr;
    }
}