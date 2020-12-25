<?php
require_once("domain/interfaces/PatientRepInterface.php");
require_once("domain/core/Patient.php");

class PatientRep implements PatientRepInterface

{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM patient");
        foreach ($res as $row) {
            array_push($arr,Patient::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Patient
    {
        return Patient::fromAssocArray($this->db->readQuery("SELECT * FROM patient WHERE id=?","i",$id)[0]);
    }

    public function create(Patient $obj): void
    {
        $this->db->writeQuery("INSERT INTO patient VALUES(NULL,?,?,?,?,?,?)","sssssi",
            $obj->getName(),$obj->getSex(),$obj->getDateOfBirth()->format("Y-m-d"),$obj->getPhone(),
            $obj->getDiagnosis(),$obj->getAddressId());
    }

    public function update(Patient $obj): void
    {
        $this->db->writeQuery("UPDATE patient SET name=?,sex=?,date_of_birth=?,phone=?,diagnosis=?,address_id=?
            WHERE id=?","sssssii",
            $obj->getName(),$obj->getSex(),$obj->getDateOfBirth()->format("Y-m-d"),$obj->getPhone(),
            $obj->getDiagnosis(),$obj->getAddressId(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM patient WHERE id=?","i",$id);
    }
}