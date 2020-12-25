<?php
global $db;

$patientRep = new PatientRep($db);
$patients = $patientRep->getAll();
$mark_ru = array('Not use'=>"Не использовалось",'Excellent'=>"Замечательно",'Good'=>"Хорошо",'Satisfactory'=>"Удовлетворительно",'Terrible'=>"Ужасно");
?>

<form action="/bd/insert/review">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Качество обслуживания</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="quality_of_service">
            <?php foreach ($mark_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Цена</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="reasonable_price">
            <?php foreach ($mark_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';
            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Скорость доставки</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="delivery_speed">
            <?php foreach ($mark_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';
            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Качество доставки</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="delivery_quality">
            <?php foreach ($mark_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';
            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Пожелания</span>
        </div>
        <input type="text" name="wishes" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
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

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>