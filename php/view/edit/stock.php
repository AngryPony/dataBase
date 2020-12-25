<?php
global $db;
$rep = new StockRep($db);
$obj = $rep->getById($_GET["id"]);
$pharmacyRep = new PharmacyRep($db);
$pharmacies = $pharmacyRep->getAll();
$storRep = new StorehouseRep($db);
$stores = $storRep->getAll();
$medRep = new MedicineRep($db);
$meds = $medRep->getAll();

?>

<form action="/bd/save/stock">
    <input type="hidden" name="id" value="<?=$obj->getId()?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Количество</span>
        </div>
        <input required type="number" name="amount" value="<?=$obj->getAmount()?>" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дата обновления</span>
        </div>
        <input type="text" name="update_date" value="<?=$obj->getUpdateDate()->format("Y-m-d")?>" class="date-input form-control" placeholder="0000-00-00" aria-label="" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Аптека</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="pharmacy_id">
            <option></option>
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
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Склад</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="storehouse_id">
            <option></option>
            <?php
            /* @var $item Storehouse */
            foreach ($stores as $item){
                if($item->getId() == $obj->getStorehouseId()){
                    echo '<option selected value="'.$item->getId() .'">'.$item->getName().'</option>';
                }else{
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
                }

            }?>
        </select>
    </div>

    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text bg-dark text-white" for="inputGroupSelect02">Лекарство</label>
        </div>
        <select class="custom-select" id="inputGroupSelect02" name="medicine_id">
            <option></option>
            <?php
            /* @var $item Medicine */
            foreach ($meds as $item){
                if($item->getId() == $obj->getMedicineId()){
                    echo '<option selected value="'.$item->getId() .'">'.$item->getName().'</option>';
                }else{
                    echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
                }

            }?>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>