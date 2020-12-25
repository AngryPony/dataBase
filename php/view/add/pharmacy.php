<?php
global $db;
$addrRep = new AddressRep($db);
$adrs =$addrRep->getAll();
?>

<form action="/bd/insert/pharmacy">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Название</span>
        </div>
        <input required type="text" name="name" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input required type="text" name="phone" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Адрес</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="address_id">
            <?php
            /* @var $item Address */
            foreach ($adrs as $a){
                echo '<option value="'.$a->getId() .'">'."г. ".$a->getCity().", ул. ".$a->getStreet().", д. ".$a->getBuild().", ".$a->getZipCode().'</option>';

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>