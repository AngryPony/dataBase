<?php


interface StockRepInterface
{
    public function getAll() : array;
    public function getById(int $id) : Stock;
    public function create(Stock $obj) : void;
    public function update(Stock $obj) : void;
    public function delete(int $id) : void;
}