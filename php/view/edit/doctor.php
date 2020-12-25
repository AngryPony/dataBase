<?php
global $db;
$rep = new DoctorRep($db);
$adr = $rep->getById($_GET["id"]);
?>

<form action="/bd/save/doctor">
    <input type="hidden" name="id" value="<?=$adr->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">ФИО</span>
        </div>
        <input required type="text" name="name" value="<?=$adr->getName()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Место работы</span>
        </div>
        <input required type="text" name="work_place" value="<?=$adr->getWorkPlace()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input type="text" name="phone" value="<?=$adr->getPhone()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Рабочий адрес</span>
        </div>
        <input type="text" name="work_address" value="<?=$adr->getWorkAddress()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <button type="submit" class="btn btn-success">Сохранить</button>
</form>