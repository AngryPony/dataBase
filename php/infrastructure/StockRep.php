<?php
require_once("domain/interfaces/StockRepInterface.php");
require_once("domain/core/Stock.php");
class StockRep implements StockRepInterface
{
    private $db;
    public function __construct($db)
    {
        $this->db = $db;
    }
    public function getAll(): array
    {
        $arr = array();
        $res = $this->db->readQuery("SELECT * FROM stock");
        foreach ($res as $row) {
            array_push($arr,Stock::fromAssocArray($row));
        }
        return $arr;
    }

    public function getById(int $id): Stock
    {
        return Stock::fromAssocArray($this->db->readQuery("SELECT * FROM stock WHERE id=?","i",$id)[0]);
    }

    public function create(Stock $obj): void
    {
        $this->db->writeQuery("INSERT INTO stock VALUES(NULL,?,?,?,?,?)","isiii",
            $obj->getAmount(),$obj->getUpdateDate()->format("Y-m-d"),$obj->getPharmacyId(),$obj->getStorehouseId(),$obj->getMedicineId());
    }

    public function update(Stock $obj): void
    {
        $this->db->writeQuery("UPDATE stock SET amount=?,update_date=?,pharmacy_id=?,storehouse_id=?,
                medicine_id=? WHERE id=?","isiiii",
            $obj->getAmount(),$obj->getUpdateDate()->format("Y-m-d"),$obj->getPharmacyId(),$obj->getStorehouseId(),$obj->getMedicineId(),$obj->getId());
    }

    public function delete(int $id): void
    {
        $this->db->writeQuery("DELETE FROM stock WHERE id=?","i",$id);
    }
}