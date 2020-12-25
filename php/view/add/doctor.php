

<form action="/bd/insert/doctor">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">ФИО</span>
        </div>
        <input required type="text" name="name"  class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Место работы</span>
        </div>
        <input required type="text" name="work_place"  class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Телефон</span>
        </div>
        <input type="text" name="phone"  class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Рабочий адрес</span>
        </div>
        <input type="text" name="work_address" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <button type="submit" class="btn btn-success">Сохранить</button>
</form>