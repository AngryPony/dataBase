<?php


interface AddressRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Address;
    public function create(Address $obj) : void;
    public function update(Address $obj) : void;
    public function delete(int $id) : void;
}