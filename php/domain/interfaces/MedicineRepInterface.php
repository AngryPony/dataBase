<?php


interface MedicineRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Medicine;
    public function create(Medicine $obj) : void;
    public function update(Medicine $obj) : void;
    public function delete(int $id) : void;
}