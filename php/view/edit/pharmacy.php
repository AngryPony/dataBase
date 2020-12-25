<?php
global $db;
$rep = new PharmacyRep($db);
$addrRep = new AddressRep($db);
$obj = $rep->getById($_GET["id"]);
$adrs =$addrRep->getAll();
?>

<form action="/bd/save/pharmacy">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Название</span>
        </div>
        <input required type="text" name="name" value="<?=$obj->getName()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input required type="text" name="phone" value="<?=$obj->getPhone()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Адрес</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="address_id">
            <?php
            /* @var $item Address */
            foreach ($adrs as $a){
                if($a->getId() == $obj->getAddressId()){
                    echo '<option selected value="'.$a->getId() .'">'."г. ".$a->getCity().", ул. ".$a->getStreet().", д. ".$a->getBuild().", ".$a->getZipCode().'</option>';
                }else{
                    echo '<option value="'.$a->getId().'">'."г. ".$a->getCity().", ул. ".$a->getStreet().", д. ".$a->getBuild().", ".$a->getZipCode().'</option>';
                }

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>