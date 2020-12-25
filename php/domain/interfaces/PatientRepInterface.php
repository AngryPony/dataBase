<?php


interface PatientRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Patient;
    public function create(Patient $obj) : void;
    public function update(Patient $obj) : void;
    public function delete(int $id) : void;
}