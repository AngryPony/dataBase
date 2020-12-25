

<form action="/bd/insert/address">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Город</span>
        </div>
        <input required type="text" name="city" value="" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Улица</span>
        </div>
        <input required type="text" name="street" value="" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Дом</span>
        </div>
        <input required type="text" name="build" value="" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Индекс</span>
        </div>
        <input required type="text" name="zip_code" value="" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <button type="submit" class="btn btn-success">Сохранить</button>
</form>