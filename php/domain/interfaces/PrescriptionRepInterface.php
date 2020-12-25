<?php


interface PrescriptionRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Prescription;
    public function create(Prescription $obj) : void;
    public function update(Prescription $obj) : void;
    public function delete(int $id) : void;
}