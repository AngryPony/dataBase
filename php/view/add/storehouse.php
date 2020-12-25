<?php

$type_ru = array('main'=>"Главный", 'further'=>"Дальний");

?>

<form action="/bd/insert/storehouse">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Название</span>
        </div>
        <input required type="text" name="name" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Тип</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="type">
            <?php foreach ($type_ru as $key=>$item){
                echo '<option value="'.$key.'">'.$item.'</option>';
            }?>
        </select>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Время доставки</span>
        </div>
        <input required type="number" name="delivery_time" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>



    <button type="submit" class="btn btn-success">Сохранить</button>
</form>