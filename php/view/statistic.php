<div class="col-md-12">
    <h5>Самые популярные лекарства</h5>
<?php
global $db;

$type_ru = array('Tablets'=>'Таблетки', 'Ointments'=>'Мази','Powders'=> 'Порошки', 'Tinctures'=>'Настойки');
$way_ru = array('inner'=>'внутреннее','outer'=>'наружное','mixing with another'=>'смешивание с другим');
$disp_ru = array('prescription'=>'по рецепту', 'over-the-counter'=>'без рецепта');
$rep = new MedicineRep($db);
$data = $rep->getMostPopular(5);
?>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">Тип</th>
            <th scope="col1">Способ применения</th>
            <th scope="col2">Название</th>
            <th scope="col2">Поставщик</th>
            <th scope="col2">Цена</th>
            <th scope="col2">Критические запасы</th>
            <th scope="col2">Тип отпуска</th>
        </tr>
        </thead>
        <tbody>
        <?php
        /* @var $row Medicine */
        foreach ($data as $row){
            ?>
            <tr>
                <td><?= $type_ru[$row->getType()] ?></td>
                <td><?= $way_ru[$row->getWayOfUsing()] ?></td>
                <td><?= $row->getName() ?></td>
                <td><?= $row->getProvider() ?></td>
                <td><?= $row->getPrice() ?></td>
                <td><?= $row->getCriticalLimits() ?></td>
                <td><?= $disp_ru[$row->getDispensingMethod()] ?></td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

    <br>
    <h5>Месячный объем продаж: <span class="badge badge-success"><?php
        $orderRep = new OrderRep($db);
        echo $orderRep->getMonthTotalAmount();
            ?></span></h5><br>
    <h5>Средняя стоимость проданных за месяц лекарств: <span class="badge badge-success"><?php
        $orderRep = new OrderRep($db);
        echo $orderRep->getAveragePrice();
            ?> руб.</span></h5>
</div>