<?php
require_once("domain/interfaces/PrescriptionRepInterface.php");
require_once("domain/core/Prescription.php");
class PrescriptionRep implements PrescriptionRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM prescription");
        foreach ($res as $row) {
            array_push($arr,Prescription::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Prescription
    {
        return Prescription::fromAssocArray($this->db->readQuery("SELECT * FROM prescription WHERE id=?","i",$id)[0]);
    }

    public function create(Prescription $obj): void
    {
        $this->db->writeQuery("INSERT INTO prescription VALUES(NULL,?,?,?,?,?)","ssiii",
            $obj->getDischargeDate(),$obj->getExpirationDate(),$obj->getDoctorId(),
            $obj->getPatientId(),$obj->getMedicineId());
    }

    public function update(Prescription $obj): void
    {
        $this->db->writeQuery("UPDATE prescription SET discharge_date=?,expiration_date=?,doctor_id=?,patient_id=?,
            medicine_id=? WHERE id=?","ssiiii",
            $obj->getDischargeDate(),$obj->getExpirationDate(),$obj->getDoctorId(),
            $obj->getPatientId(),$obj->getMedicineId(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM prescription WHERE id=?","i",$id);
    }
}