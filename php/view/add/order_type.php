

<form action="/bd/insert/order_type">
    <input type="hidden" name="id" value="0">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Название</span>
        </div>
        <input required type="text" name="name" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text bg-dark text-white" id="basic-addon1">Стоимость</span>
        </div>
        <input required type="number" name="price" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
    </div>

    <button type="submit" class="btn btn-success">Сохранить</button>
</form>