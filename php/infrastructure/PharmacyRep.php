<?php

require_once("domain/interfaces/PharmacyRepInterface.php");
require_once("domain/core/Pharmacy.php");
class PharmacyRep implements PharmacyRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM pharmacy");
        foreach ($res as $row) {
            array_push($arr,Pharmacy::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Pharmacy
    {
        return Pharmacy::fromAssocArray($this->db->readQuery("SELECT * FROM pharmacy WHERE id=?","i",$id)[0]);
    }

    public function create(Pharmacy $obj): void
    {
        $this->db->writeQuery("INSERT INTO pharmacy VALUES(NULL,?,?,?)","ssi",
            $obj->getName(),$obj->getPhone(),$obj->getAddressId());
    }

    public function update(Pharmacy $obj): void
    {
        $this->db->writeQuery("UPDATE pharmacy SET name=?,phone=?,address_id=? WHERE id=?","ssii",
            $obj->getName(),$obj->getPhone(),$obj->getAddressId(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM pharmacy WHERE id=?","i",$id);
    }
}