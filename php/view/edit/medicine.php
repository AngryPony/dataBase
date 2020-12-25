<?php
global $db;
$rep = new MedicineRep($db);
$obj = $rep->getById($_GET["id"]);
$type_ru = array('Tablets'=>'Таблетки', 'Ointments'=>'Мази','Powders'=> 'Порошки', 'Tinctures'=>'Настойки');
$way_ru = array('inner'=>'внутреннее','outer'=>'наружное','mixing with another'=>'смешивание с другим');
$disp_ru = array('prescription'=>'по рецепту', 'over-the-counter'=>'без рецепта');
?>

<form action="/bd/save/medicine">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Тип</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="type">
            <?php foreach ($type_ru as $key=>$item){
                if($key == $obj->getType()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Способ применения</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="way_of_using">
            <?php foreach ($way_ru as $key=>$item){
                if($key == $obj->getWayOfUsing()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Имя</span>
        </div>
        <input required type="text" name="name" value="<?=$obj->getName()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Поставщик</span>
        </div>
        <input type="text" name="provider" value="<?=$obj->getProvider()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Тип отпуска</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="dispensing_method">
            <?php foreach ($disp_ru as $key=>$item){
                if($key == $obj->getDispensingMethod()){
                    echo '<option selected value="'.$key.'">'.$item.'</option>';
                }else{
                    echo '<option value="'.$key.'">'.$item.'</option>';
                }

            }?>
        </select>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Цена</span>
        </div>
        <input required type="number" name="price" value="<?=$obj->getPrice()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Критический запас</span>
        </div>
        <input required type="number" name="critical_limits" value="<?=$obj->getCriticalLimits()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>