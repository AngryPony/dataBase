<?php


interface OrderTypeRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : OrderType;
    public function create(OrderType $obj) : void;
    public function update(OrderType $obj) : void;
    public function delete(int $id) : void;

}