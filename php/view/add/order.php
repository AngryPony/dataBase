<?php
global $db;
$patientRep = new PatientRep($db);
$patients = $patientRep->getAll();
$pharmacyRep = new PharmacyRep($db);
$pharmacies = $pharmacyRep->getAll();
$orderTypeRep = new OrderTypeRep($db);
$orderTypes = $orderTypeRep->getAll();
$status_ru = array('in progress'=>"В процессе", 'done'=>"Готово", 'waiting'=>"Ождиание");
?>

<form action="/bd/insert/order">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Адрес доставки</span>
        </div>
        <input required type="text" name="delivery_address" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дата</span>
        </div>
        <input required type="text" name="date_of_creation" class="date-input form-control" placeholder="0000-00-00" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Количество</span>
        </div>
        <input required type="number" min="0" name="amount" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Статус</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="status">
            <?php foreach ($status_ru as $key=>$item){
                    echo '<option value="'.$key.'">'.$item.'</option>';
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
                echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
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
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';

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
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>