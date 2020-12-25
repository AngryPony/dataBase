<?php


interface DoctorRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Doctor;
    public function create(Doctor $obj) : void;
    public function update(Doctor $obj) : void;
    public function delete(int $id) : void;
}