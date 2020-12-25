<?php
global $db;
$rep = new OrderTypeRep($db);
$obj = $rep->getById($_GET["id"]);
?>

<form action="/bd/save/order_type">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Название</span>
        </div>
        <input required type="text" name="name" value="<?=$obj->getName()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Стоимость</span>
        </div>
        <input required type="number" name="price" value="<?=$obj->getPrice()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>