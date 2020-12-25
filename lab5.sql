use apteka;

	/* Индексы */
    
/*Запросить заказы количество который от 50 и до 200 */
create index  amount on `order`(`amount`);

    select * from `order`
    where `order`.amount > 50 and `order`.amount <= 200
    order by Amount desc;

drop index  amount on `order`;

/*Запросить заказы которые завершены */
create index `status` on `order`(`status`);

    select * from `order`
    where `order`.`status` = 'done'
    order by `Date of creation` desc;    

drop index status on `order`;
 
/* Вывести всех пациентов мужского пола*/
create index sex on patient(sex);

	select FIO, Sex, Diagnosis from patient
	where sex = 'male'
	order by FIO ;

drop index sex on patient;

/* Вывести лекарства со стоимостью больше 700 рублей и критическими запасами меньше 50*/
create index price_lim on medicine (`price`, `Critikal limits`);

	select * from medicine
	where price > 700 and `Critikal limits` < 50
	order by price;

drop index price_lim on medicine;
    
    /* Показать все цены на лекарства*/
create index price on medicine(`price`);
    
   select distinct price from medicine
   order by price desc;
   
drop index price on medicine;

/* Найти пациента по номеру телефоны*/
create unique index phone on patient(phone);

	select * from patient
	where Phone = '+7 (911) 679-5411-81';

drop index phone on patient;


	/* Процедуры и функции */
  
 /* Простая процедура без параметров - вывод всех пациентов */ 
DELIMITER |
create procedure sp_getAllPatient()
BEGIN
	select * from patient;
END
|

call sp_getAllPatient;
drop procedure sp_getAllPatient;

/* процедура с параметром - вывод пациента по фио */ 
DELIMITER |
create procedure sp_patientByFIO(in p_Fio varchar(45) )
BEGIN
	select * from patient
    where FIO = p_Fio;
END
|
call sp_patientByFIO('Поляков Баратолий Леонидович');
drop procedure sp_patientByFIO;

/* Получить перечень лекарств с минимальным запасом на складе в целом */
DELIMITER |
create procedure sp_lowestMedicine()
BEGIN
	select `name`, provider, Amount
    from medicine, stock
    where stock.Amount = (select min(amount) from stock) 
    and  medicine.idmedicine = stock.medicine_idmedicine;
END
|
call sp_lowestMedicine;
drop procedure sp_lowestMedicine;

/* Узнать востребовательность поставщика */
drop procedure IF EXISTS sp_providerPopularity;
DELIMITER |
create procedure sp_providerPopularity(in p_provider varchar(45), out p_status varchar(45) )
BEGIN
	declare summ int;
    set summ = (select COALESCE (sum(amount)) from patient_orders where patient_orders.provider = p_provider);
    if summ > 500 then
		set p_status = 'Very popular provider';
    elseif summ between 100 and 500 then
		set p_status = 'popular provider';
	else
		set p_status = 'unpopular provider';
    END if;
END
|

call sp_providerPopularity('cifan',@p);
select @p;

/* Узнать совершеннолетний ли пациент */
drop function if exists IsAdult;
DELIMITER |
create function IsAdult (f_FIO varchar(45) )
returns varchar(45)
DETERMINISTIC
Begin
	declare result varchar(30);
    declare f_year smallint;
    declare yearOfBirth smallint;
    
    set yearOfBirth = (select year(`Date of Birth`) from patient where FIO = f_FIO);
    set f_year = year(curdate());
		if (f_year - yearOfBirth > 17) then
			set result = 'Совершеннолетний пациент';
		else
			set result = 'Несовершеннолетний пациент';
	end if;
return result;
end;
|

select IsAdult('Никифорова Элизабет Валерьяновна');

/* Узнать расстояние от главного офиса */
drop function if exists distanceToOffice;
DELIMITER |
create function distanceToOffice (f_FIO varchar(45) )
returns varchar(30)
DETERMINISTIC
Begin
	declare result varchar(30);
    declare f_city varchar(30);
    
    set f_city = (  select city from  address
					join patient on idadress = address_idadress
					where FIO = f_FIO  );
	case f_city
		when 'Волгоград' then 
        set result = 'Близкое расположение';
        when 'Волжский' then
        set result = 'Среднее расположение';
		else
        set result = 'Дальнее расположение';
	end case;
return result;
end;
|

select distanceToOffice('R2D2');

/* Узнать р */
drop function if exists getMedicine;
DELIMITER |
create function getMedicine (order_id int )
returns text
DETERMINISTIC
Begin
	declare result text;
    declare cur_id int;
    declare med_name varchar (255);
    declare done int default 0;
    declare cur1 cursor for select medicine_idmedicine from order_has_medicine, `order`
							where order_idorder = idorder;
	declare continue handler for sqlstate '02000' set
    done = 1;
    
    open cur1;
	while done = 0 do
		fetch cur1 into cur_id;
        select `name` into med_name from medicine where idmedicine = cur_id;
        set result = concat_ws('', result, med_name);
	end while;
    close cur1;
	return result;
end;
|

select getMedicine(6);



		/* Представления */
        
/* Создать виртуальную таблицу с информацией об медикаментах от sunpraz */
create view sunpraz_medicine as
	select * from medicine
    where medicine.provider = 'sunpraz'
    order by price;
    
    select * from sunpraz_medicine;

/* Создать виртуальную таблицу с информацией ою медикаментах от Dazolic */
create view dazolic_medicine as
	select * from medicine
    where medicine.provider = 'Dazolic'
    order by price;
    
    select * from dazolic_medicine;

/* Создать виртуальную таблицу с информацией ою медикаментах от Cifran */
create ALGORITHM = MERGE 
view cifran_medicine as
	select * from medicine
    where medicine.provider = 'Cifran'
    order by price;
    
    select * from cifran_medicine;
    
    /* Создать виртуальную таблицу клиентов и их заказов  */
create view patient_orders as 
	select FIO, Sex, phone, `order`.Amount, medicine.name, medicine.provider
    from patient
    join `order` on patient.idpatient = `order`.patient_idPatient
    join order_has_medicine on `order`.idorder = order_has_medicine.order_idorder
    join medicine on order_has_medicine.medicine_idmedicine = medicine.idmedicine
    order by patient.FIO;
    
    select * from patient_orders;
    
    /* Создать виртуальную таблицу с 3 ценами */
    create ALGORITHM = TEMPTABLE 
    view types_prices as 
    select max(price) as 'Highest price', min(price) as 'Lowest price', avg(price) as 'Average price' 
    from medicine;
    
    select * from types_prices;