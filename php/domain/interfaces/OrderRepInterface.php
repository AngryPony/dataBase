<?php


interface OrderRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Order;
    public function create(Order $obj) : int;
    public function update(Order $obj) : void;
    public function delete(int $id) : void;
    public function getMedicines(int $id) : string;
    public function getMonthTotalAmount() : int;
    public function getAveragePrice():int;
    public function getAllMedicines(int $id) : array;
    public function removeMedicines(int $id) : void;
    public function addMedicine(int $order_id,int $medicineId) : void;
}