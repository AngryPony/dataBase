<?php
global $db;
$rep = new ReviewsRep($db);
$patientRep = new PatientRep($db);
$patients = $patientRep->getAll();
$obj = $rep->getById($_GET["id"]);
$mark_ru = array('Not use'=>"Не использовалось",'Excellent'=>"Замечательно",'Good'=>"Хорошо",'Satisfactory'=>"Удовлетворительно",'Terrible'=>"Ужасно");
?>

<form action="/bd/save/review">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">


    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Качество обслуживания</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="quality_of_service">
            <?php foreach ($mark_ru as $key=>$item){
                if($key == $obj->getQualityOfService()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Цена</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="reasonable_price">
            <?php foreach ($mark_ru as $key=>$item){
                if($key == $obj->getReasonablePrice()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Скорость доставки</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="delivery_speed">
            <?php foreach ($mark_ru as $key=>$item){
                if($key == $obj->getDeliverySpeed()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Качество доставки</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="delivery_quality">
            <?php foreach ($mark_ru as $key=>$item){
                if($key == $obj->getDeliveryQuality()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Пожелания</span>
        </div>
        <input type="text" name="wishes" value="<?=$obj->getWishes()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
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

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>