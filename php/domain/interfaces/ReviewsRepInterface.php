<?php


interface ReviewsRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Reviews;
    public function create(Reviews $obj) : void;
    public function update(Reviews $obj) : void;
    public function delete(int $id) : void;
}