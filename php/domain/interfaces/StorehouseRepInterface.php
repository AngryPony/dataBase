<?php


interface StorehouseRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Storehouse;
    public function create(Storehouse $obj) : void;
    public function update(Storehouse $obj) : void;
    public function delete(int $id) : void;
}