<?php


interface PharmacyRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Pharmacy;
    public function create(Pharmacy $obj) : void;
    public function update(Pharmacy $obj) : void;
    public function delete(int $id) : void;
}