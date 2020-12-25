<?php
require_once("domain/interfaces/DoctorRepInterface.php");
require_once("domain/core/Doctor.php");
class DoctorRep implements DoctorRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM doctor");
        foreach ($res as $row) {
            array_push($arr,Doctor::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Doctor
    {
        return Doctor::fromAssocArray($this->db->readQuery("SELECT * FROM doctor WHERE id=?","i",$id)[0]);
    }

    public function create(Doctor $obj): void
    {
        $this->db->writeQuery("INSERT INTO doctor VALUES(NULL,?,?,?,?)","ssss",
            $obj->getName(),$obj->getWorkPlace(),$obj->getPhone(),$obj->getWorkAddress());
    }

    public function update(Doctor $obj): void
    {
        $this->db->writeQuery("UPDATE doctor SET name=?,work_place=?,phone=?,work_address=? WHERE id=?","ssssi",
            $obj->getName(),$obj->getWorkPlace(),$obj->getPhone(),$obj->getWorkAddress(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM doctor WHERE id=?","i",$id);
    }
}