<?php
global $db;
$addrRep = new AddressRep($db);
$sex_ru = array('Male'=>"Мужской",'Female'=>"Женский",'Other'=>"Другой");
$adrs =$addrRep->getAll();
?>

<form action="/bd/insert/patient">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Имя</span>
        </div>
        <input required type="text" name="name" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Пол</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="sex">
            <?php foreach ($sex_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';
            }?>
        </select>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дата рождения</span>
        </div>
        <input required type="text" name="date_of_birth" class="date-input form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input required type="text" name="phone" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Диагноз</span>
        </div>
        <input required type="text" name="diagnosis" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Адрес</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="address_id">
            <?php
            /* @var $item Address */
            foreach ($adrs as $a){
                echo '<option value="'.$a->getId().'">'."г. ".$a->getCity().", ул. ".$a->getStreet().", д. ".$a->getBuild().", ".$a->getZipCode().'</option>';

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>