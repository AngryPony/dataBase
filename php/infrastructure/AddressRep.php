<?php
require_once("domain/DB.php");
require_once("domain/interfaces/AddressRepInterface.php");
require_once("domain/core/Address.php");
class AddressRep implements AddressRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll() : array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM address");
        foreach ($res as $row) {
            array_push($arr,Address::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById($id) : Address
    {
        return Address::fromAssocArray($this->db->readQuery("SELECT * FROM address WHERE id=?","i",$id)[0]);
    }

    public function create(Address $obj) : void
    {
        $this->db->writeQuery("INSERT INTO address VALUES(NULL,?,?,?,?)","ssss",
            $obj->getCity(),$obj->getStreet(),$obj->getBuild(),$obj->getZipCode());
    }

    public function update(Address $obj) : void
    {
        $this->db->writeQuery("UPDATE address SET city=?,street=?,build=?,zip_code=? WHERE id=?","ssssi",
            $obj->getCity(),$obj->getStreet(),$obj->getBuild(),$obj->getZipCode(),$obj->getId());
    }

    public function delete(int $id) : void
    {
        $this->db->writeQuery("DELETE FROM address WHERE id=?","i",$id);
    }

}