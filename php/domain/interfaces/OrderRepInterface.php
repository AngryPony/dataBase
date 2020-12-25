<?php


interface OrderRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Order;
    public function create(Order $obj) : void;
    public function update(Order $obj) : void;
    public function delete(int $id) : void;
    public function getMedicines(int $id) : string;
}