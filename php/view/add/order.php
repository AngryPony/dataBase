<?php
global $db;
$patientRep = new PatientRep($db);
$patients = $patientRep->getAll();
$pharmacyRep = new PharmacyRep($db);
$pharmacies = $pharmacyRep->getAll();
$orderTypeRep = new OrderTypeRep($db);
$orderTypes = $orderTypeRep->getAll();
$status_ru = array('in progress'=>"В процессе", 'done'=>"Готово", 'waiting'=>"Ождиание");
$medicineRep = new MedicineRep($db);
$medicines = $medicineRep->getAll();

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

    <div class="medicines_wrap">
    </div>
    <a href="#" class="btn btn-success" id="add_medicine"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
        </svg></a><br><br>
    <button type="submit" class="btn btn-success">Добавить</button>
</form>

<script>
    $(function(){
        $("#add_medicine").click(function(e){
            e.preventDefault();
            $(".medicines_wrap").append(
                '<div class="input-group mb-3"><div class="input-group-prepend">'+
                '<label class="input-group-text bg-dark text-white border-dark" >Лекарство</label>'+
                '<button class="btn btn-danger remove_medicine" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">'+
                '<path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>'+
                '</svg></button></div>'+
                '<select class="custom-select medicineSelect" name="medicine_id[]">' +
                $("#medicinesOptions").html()+
                '</select></div>'
            );
            $(".remove_medicine").click(function(e){
                e.preventDefault();
                $(this).parent().parent().remove();
            })
        })

        $(".remove_medicine").click(function(e){
            e.preventDefault();
            $(this).parent().parent().remove();
        })


    })
</script>
<div id="medicinesOptions" style="display: none">
    <?php
    /* @var $item Medicine */
    foreach ($medicines as $item){
        echo '<option value="'.$item->getId().'">'.$item->getName().'</option>';
    }?>
</div>