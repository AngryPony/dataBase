USE apteka;

/*Транзакционные (задачи учёта): */

	/* Удалить отзыв */
	delete from apteka.reviews
	where idreviews = 8;
    
	/* Изменить отзыв */
    update reviews
    set `Quality of service` = 'Excellent', 
		`Reasonable price` = 'Excellent', 
        `Delivery speed` = 'Excellent', 
        `Delivery quality` = 'Excellent', 
        `Wishes` = null
    where idreviews = 12;
    
	/* Отметить заказ */
    delete from `order`
    where idorder = 12;
    
	/* Перенести планируемую дату доставки */
    update storehouse
    set `Delivery Time` = 3
    where idstorehouse = 10;
    
	/* Перенести адрес заказа */
    update `order`
	set `Delivery adress` = 'ул. Мелиоративная, 10, Светлый Яр, Волгоградская обл., 414161'
    where idorder = 11;
    
/* Справочные (оперативные запросы): */

	/* Получить перечень и типы лекарств, достигших своей критической нормы или закончившихся */
    select `name`, provider, `type`
    from medicine, stock
    where medicine.idmedicine = stock.medicine_idmedicine
    and stock.Amount < medicine.`Critikal limits`;
    
	/* Получить перечень лекарств с минимальным запасом на складе в целом */
    select `name`, provider, Amount
    from medicine, stock
    where stock.Amount = (select min(amount) from stock) 
    and  medicine.idmedicine = stock.medicine_idmedicine;
    
	/* Получить перечень лекарств с минимальным запасом на складе по указанной категории медикаментов */
    select `name`, type, provider, Amount
    from medicine, stock
    where stock.Amount = (select min(amount) from stock) 
    and stock.medicine_idmedicine = medicine.idmedicine 
    and medicine.Type = 'Powders';
    
	/* Получить полный перечень и общее число заказов, находящихся в производстве */
    select amount, medicine.Name, medicine.Provider
    from `order`, medicine, order_has_medicine
    where `order`.status = 'in progress'
	and `order`.idorder = order_has_medicine.order_idorder 
    and order_has_medicine.medicine_idmedicine = medicine.idmedicine
    order by Amount;
    
	/* Получить активные заказы в одной аптеке */
	select `name`, city, street, `zip code`,`order`.Amount, `Date of creation`
    from  `order`, pharmacy, address
    where `order`.Status = 'in progress'
    and `order`.pharmacy_idpharmacy = pharmacy.idpharmacy 
    and pharmacy.address_idadress = address.idadress;

/* Справочные расчётные (аналитические запросы): */
	/* Получить сведения о покупателях, которые не пришли забрать свой заказ в назначенное им время и их число */
    select idPatient, FIO, Phone, `order`.status
    from patient, `order`, storehouse
    where patient.idPatient = `order`.patient_idPatient
    and `order`.status = 'waiting'
    and date_sub(current_date(), interval )
    
	/* Получить перечень пяти наиболее часто используемых медикаментов в целом */
    select medicine.name, type, Provider
    from `order`, medicine
    where pharmacy_idpharmacy = medicine.idmedicine
    group by pharmacy_idpharmacy
    order by count(*) desc
		limit 5;
    
	/* Получить сведения о трех клиентах сделавших самые большие заказы */
    select FIO, Sex, phone, `order`.Amount
    from patient, `order`
    where `order`.patient_idPatient = patient.idPatient
    group by `order`.Amount
    order by `order`.Amount desc
		limit 3;
        
	/* Получить месячный объем продаж лекарств */
    select sum(amount) as TotalAmount from `order`
    where curdate() >= `order`.`Date of creation` and curdate() <= date_add(`order`.`Date of creation`, interval 1 month);
    
	/* Получить среднюю стоимость лекарств, проданных за месяц */
	select avg(amount * medicine.Price) as 'AveragePrice in rub' from `order`, medicine
    where curdate() > `order`.`Date of creation` and curdate() < date_add(`order`.`Date of creation`, interval 1 month);

/* Запросы INSERT*/

insert pharmacy (address_idadress, name, phone)
values (3,'Rigla','8(909)398-21-23');

insert address (`build/house`, city, street, `zip code`)
VALUES
(23,'Волгоград','Ленанина', 400007),
(19,'Волгоград','Земляки', 400607),
(16,'Волгоград','Металлургов', 400407);

insert pharmacy(address_idadress, name, phone)
values 
(20,'Rigla','8(909)398-21-23'),
(21,'Волгофарм','8(909)400-40-30'),
(22,'Аптека №12','8(8442)98-21-03');

insert stock (Amount,`Update date`, pharmacy_idpharmacy, storehouse_idstorehouse, medicine_idmedicine)
values
(20, '2020-03-25', 7, null, 12),
(200, '2020-11-15', null, 3, 7),
(6, '2020-09-21', 2, null, 2);


/* Запросы UPDATE (с WHERE) */

update address
Set street = 'Землячки'
where street = 'Земляки';
update address
Set street = 'Ленина'
where street = 'Ленанина';

update medicine
set price = price + 60; /* увеличиваем цену на все лекарства */

update stock
set amount = amount + 20
where amount < 100;

update `order type`
set price = price - 10
where not (`order type`.name = 'Самовывоз' OR  `order type`.name ='Почта России');

update doctor
set `place of work` = 'ЧК Панацея'
where `place of work` = 'Панацея';

update medicine
set price = price - 30
where `Dispensing method` = 'over-the-counter';

update medicine
set `Way of using` = 'mixing with another'
where `Name` = 'КЛАБАКС 500МГ.';


/* Запросы Delete (с WHERE) */

delete from medicine
where price > 5000 or `Critikal limits` > 100;

Create table test
 ( 
	id int primary key auto_increment,
	test1 varchar(45),
	im varchar(45)
);

insert test (test1, im)
VALUES
('123','321'),
('d','dsa'),
('qwea32312sd','123212312'),
('4123','sda12312323'),
('13','2221');

delete from test
where length(im) > 5;

delete from test
where length(test1) < 3 and length(test1) > 10;

delete from test;

drop table test;


/* Запросы distinct(2), not(4), in(2), between, is null,as */

Create table test
 ( 
	id int primary key auto_increment,
	price int,
	name varchar(45),
    amount int,
    popularity int unsigned default 0,
    check (popularity >= 0 and popularity <= 100)
);

insert test (price, name, amount, popularity)
VALUES
(5000,'detail1', 40, 30),
(500,'detail2', 40, 30),
(500,'detail3', 350, 100),
(1500,'detail4', 40, 80),
(5000,'detail5', 40, 30),
(1400, null, 40, 75),
(2230,'detail1', null, 0),
(210,'detail2', 21, 30),
(21100,'detail3', null, 30),
(200,'detail5', null, 0);

select distinct * from test; 

select distinct price, amount from test;

select name
from test
where not name = 'detail1';

select name, price as 'Price in rub'
from test
where amount is not null and name is not null;

select popularity
from test
where not popularity = 0;

select * from test
where name in ('detail1', 'detail2');

select * from test
where name not in ('detail1', 'detail2', 'detail3');

select * from test
where popularity between 70 and 100 
AND price between 1000 and 3000;

update test
set price = price - 100
where price not between 0 and 500
AND popularity < 50;

select * from test
where name is null or amount is null;

select price as цена, name as Наименование, amount as Количество, popularity as Популярность
from test;
drop table test;

/* Запросы Like, REGEXP */

select * from patient
where FIO like '%а';

select * from patient
where FIO like 'ч%';

select * from patient
where FIO like '%ова%';

select * from patient
where FIO not like '%а';

select * from patient
where FIO not like 'ч%';

select * from patient
where FIO not like '%ова%';

select * from patient
where FIO like 'к%ч';

select * from patient
where FIO  like '_н%';

select * from patient
where Phone REGEXP '38|33';

select * from storehouse
where name REGEXP 'Склад [14]';

select * from storehouse
where name REGEXP 'Склад [1-3]';

/* Запросы Сount, max, min, sum, avg */

Create table test
 ( 
	id int primary key auto_increment,
    name varchar(45),
	price int,
    amount int,
    discount int,
    check (discount < price)
);

insert test (name, price, amount, discount)
VALUES
('product1', 400, 60, 150),
('product2', 800, 20, 0),
('product3', 900, 50, 0),
('product4', 800, 25, 210),
('product5', 1200, 20, 90),
('product6', 220, 55, 0),
('product6', 100, 41, 0),
('product6', 1233, 21, 0),
('product6', 240, 55, 0),
('product7', 390, 20, 0);

select count(id) as NumberOfProducts 
from test;

select count(discount)
from test
where discount != 0;

select count(name)
from test
where discount = 0 and amount between 20 and 30;

select avg(price) as 'Средняя цена'
from test;

select sum((price - discount)*amount) as TotalCost
from test;

select sum(amount)
from test;

select sum(amount) as TotalAmount6
from test
where name = 'product6';

select min(price) as SmallestPrice
from test;

select max(price) as LargestPrice
from test;

drop table test;


/* Запросы Group by, having */

select provider, count(*) as ProviderCount
from medicine
group by Provider
having count(*) > 2;

select provider, `way of using`, count(*) as ProviderCount
from medicine
group by Provider, `way of using`;


select provider, count(*) as ProviderCount
from medicine
where `Way of using` != 'inner'
group by Provider
having count(*) > 2;

select name, phone, count(*) as NameCount
from pharmacy
where length(name) > 5
and pharmacy.Phone regexp '^8'
group by Name
Having count(*) > 1;


/* Запросы order by, ASC|DESC */

select * from medicine
order by price;

Create table test
 ( 
	id int primary key auto_increment,
    name varchar(45),
	price int,
    amount int,
    discount int,
    check (discount < price)
);

insert test (name, price, amount, discount)
VALUES
('product1', 400, 60, 150),
('product2', 800, 20, 0),
('product3', 900, 50, 0),
('product4', 800, 25, 210),
('product5', 1200, 20, 90),
('product6', 220, 55, 0),
('product6', 100, 41, 0),
('product6', 1233, 21, 0),
('product6', 240, 55, 0),
('product7', 390, 20, 0);

select name, price * amount as TotalSumNoDiscount
from test
order by TotalSumNoDiscount;

select name, price, amount, (price-discount)*amount as TotalSumWithDiscount
from test
order by (price-discount)*amount;

select name, price * amount as TotalSumNoDiscount
from test
order by TotalSumNoDiscount desc;

select name, price, amount
from test
order by (price-discount)*amount desc;

select name, price, amount
from test
order by price asc, name desc;

drop table test;

/* Вложенные select */

select * from address
where idadress in
(
	select `address_idadress`
	from patient
	where idPatient in
	(
		select `patient_idPatient`
		from reviews
		where `Reasonable price` = 'Excellent'
	)
);

select FIO, phone
from patient
where idPatient in
(
	select patient_idPatient
    from `order`
    where Status = 'in progress' and curdate() > date_add(`Date of creation`,  interval 7 day)
);


/* Запросы select into 	
select * into PatientCopy
from patient;

select FIO, sex into ShortPatient
from patient;

select * into OnlyFemale
from patient
where sex = 'female';

select patient.FIO, `order`.idorder
into test1
from patient,order
left join `order` on patient.patientid = `order.patientid`;

drop table PatientCopy, ShortPatient, OnlyFemale, test1; */

create table PatientCopy as select * from patient;

create table ShortPatient as select FIO, sex from patient;

create table OnlyFemale 
as select * from patient
where sex = 'female';

select * from PatientCopy;
select * from ShortPatient;
select * from OnlyFemale;

drop table PatientCopy, ShortPatient, OnlyFemale;


/* Запросы insert into select */

create table test1 
(
	id int primary key auto_increment,
    name varchar(45),
    address varchar(45),
    city varchar(45),
    country varchar(45)
);

insert test1 (name, address, city, country)
values
('Jon', 'Avenue 21', 'New York', 'USA'),
('Mike', 'Street 11', 'Berlin', 'Germane'),
('James', 'Goosetam 9', 'Berlin', 'Germane'),
('Mary', 'Grassia 58', 'Rome', 'Italia');
    
create table test2 
(
	id int primary key auto_increment,
    name varchar(45),
    address varchar(45),
    city varchar(45),
    country varchar(45)
);

insert test2 (name, address, city, country)
values
('Katrin', 'Hast 21', 'Paris', 'France'),
('Rayan', 'Kenstring 11/2', 'Detroid', 'USA');

INSERT INTO test1 (name, city, country)
SELECT name, city, country FROM test2;

INSERT INTO test1 (name, city, country)
SELECT name, city, country FROM test2
where country = 'USA';

drop table test1, test2;


/* Запросы UNION (ALL), EXCEPT, INTERCEPT */

create table test1 
(
	id int primary key auto_increment,
    name varchar(45),
    address varchar(45),
    city varchar(45),
    country varchar(45)
);

insert test1 (name, address, city, country)
values
('Jon', 'Avenue 21', 'New York', 'USA'),
('Mike', 'Street 11', 'Berlin', 'Germane'),
('James', 'Goosetam 9', 'Berlin', 'Germane'),
('Mary', 'Grassia 58', 'Rome', 'Italia');
    
create table test2 
(
	id int primary key auto_increment,
    name varchar(45),
    address varchar(45),
    city varchar(45),
    country varchar(45)
);

insert test2 (name, address, city, country)
values
('Katrin', 'Hast 21', 'Paris', 'France'),
('Rayan', 'Kenstring 11/2', 'Detroid', 'USA'),
('Alena', 'Grassia 18', 'Rome', 'Italia');

select city from  test1
union /* without duplicate */
select city from test2
order by city;

select country from test1
union all
select country from test2
order by country;

select city,country from test1
union all
select city, country from test2
where length(city) > 5
order by country;

/*
select country
from test1
except 
select country
from test2;
				output: USA, Germane

select country
from test1 
intersect
select country
from test2;
				output: Italia
*/

drop table test1, test2;


/* JOIN:  INNER, OUTTER (LEFT, RIGHT, FULL), CROSS, NATURAL */

/* JOIN:  INNER, OUTTER (LEFT, RIGHT, FULL), CROSS, NATURAL */

create table customers 
(
	id int primary key auto_increment,
    name varchar(45),
    address varchar(45),
    city varchar(45),
    country varchar(45)
);

insert customers (name, address, city, country)
values
('Jon', 'Avenue 21', 'New York', 'USA'),
('Mike', 'Street 11', 'Berlin', 'Germane'),
('James', 'Goosetam 9', 'Berlin', 'Germane'),
('Mary', 'Grassia 58', 'Rome', 'Italia');

create table goods
(
	goodsid int primary key auto_increment,
    name varchar(45),
    price int not null,
    customersId INT NOT NULL REFERENCES customers(Id) ON DELETE CASCADE
);

insert goods (goodsid, name, price, customersId)
values
(1, 'phone', 20000, 2),
(2, 'PC', 51000, 1),
(3, 'ridge', 21800, 4),
(4, 'keyboard', 5400, 3);

select * from customers
inner join goods
on customers.id = goods.customersId;

select goods.name, goods.price, customers.name
from customers
inner join goods
on customers.id = goods.customersId;

select goods.name, goods.price, customers.name
from customers
inner join goods
on customers.id = goods.customersId and goods.price > 20000;

select goods.name, price, customersId
from goods left join customers
on goods.customersId = customers.id;

select goods.name, price, customersId
from goods right join customers
on goods.customersId = customers.id;


select goods.name, price, customersId
from goods left join customers
on goods.customersId = customers.id
where goods.price > 20000
order by goods.name;

select customers.name, price, customersId
from goods full join customers
on customersId = customers.id
where price < 21000;

select * from goods cross join customers;

select * from goods
natural join customers;

drop table goods, customers;

/* Limit */

select * from address
limit 3;

select * from address
limit 2, 3; /* skip 2 rows, than select 3 rows */

select * from address
order by city
limit 2, 3;




















