<?php
global $db;
$rep = new PatientRep($db);
$addrRep = new AddressRep($db);
$obj = $rep->getById($_GET["id"]);
$sex_ru = array('Male'=>"Мужской",'Female'=>"Женский",'Other'=>"Другой");
$adrs =$addrRep->getAll();
?>

<form action="/bd/save/patient">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Имя</span>
        </div>
        <input required type="text" name="name" value="<?=$obj->getName()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Пол</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="sex">
            <?php foreach ($sex_ru as $key=>$item){
                if($key == $obj->getSex()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дата рождения</span>
        </div>
        <input required type="text" name="date_of_birth" value="<?=$obj->getDateOfBirth()->format("Y-m-d")?>" class="date-input form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input required type="text" name="phone" value="<?=$obj->getPhone()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Диагноз</span>
        </div>
        <input required type="text" name="diagnosis" value="<?=$obj->getDiagnosis()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
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