<?php
global $db;
$rep = new OrderRep($db);
$patientRep = new PatientRep($db);
$patients = $patientRep->getAll();
$pharmacyRep = new PharmacyRep($db);
$pharmacies = $pharmacyRep->getAll();
$orderTypeRep = new OrderTypeRep($db);
$orderTypes = $orderTypeRep->getAll();
$obj = $rep->getById($_GET["id"]);
$status_ru = array('in progress'=>"В процессе", 'done'=>"Готово", 'waiting'=>"Ождиание");
?>

<form action="/bd/save/order">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Адрес доставки</span>
        </div>
        <input required type="text" name="delivery_address" value="<?=$obj->getDeliveryAddress()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дата</span>
        </div>
        <input required type="text" name="date_of_creation" value="<?=$obj->getDateOfCreation()->format("Y-m-d")?>" class="date-input form-control" placeholder="0000-00-00" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Количество</span>
        </div>
        <input required type="number" min="0" name="amount" value="<?=$obj->getAmount()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Статус</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="status">
            <?php foreach ($status_ru as $key=>$item){
                if($key == $obj->getStatus()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Пациент</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="patient_id">
            <?php
            /* @var $item Patient */
            foreach ($patients as $item){
                if($item->getId() == $obj->getPatientId()){
                    echo '<option selected value="'.$item->getId() .'">'.$item->getName().'</option>';
                }else{
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
                }

            }?>
        </select>
    </div>


    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Аптека</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="pharmacy_id">
            <?php
            /* @var $item Pharmacy */
            foreach ($pharmacies as $item){
                if($item->getId() == $obj->getPharmacyId()){
                    echo '<option selected value="'.$item->getId() .'">'.$item->getName().'</option>';
                }else{
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Способ доставки</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="type_id">
            <?php
            /* @var $item OrderType */
            foreach ($orderTypes as $item){
                if($item->getId() == $obj->getPharmacyId()){
                    echo '<option selected value="'.$item->getId() .'">'.$item->getName().'</option>';
                }else{
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
                }

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>