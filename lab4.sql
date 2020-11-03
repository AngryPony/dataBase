USE apteka;

/*Справочные
Получить перечень и типы лекарств, достигших своей критической нормы или закончившихся
*/



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
(20, 2020-11-02, 7, null, 12),
(200, 2020-09-02, null, 3, 7),
(6, 2020-10-12, 2, null, 2);


/* Запросы UPDATE (с WHERE) */

update address
Set street = 'Землячки'
where street = 'Земляки';
update address
Set street = 'Ленина'
where street = 'Ленанина';

update medicine
set price = price + 60; /* увеличиваем цену на все лекарства */

update store
set amount = amount + 20
where amount < 100;

update `order type`
set price = price - 10
where name != 'самовывоз' OR name !='Почта России';

update doctor
set `place of work` = 'ЧК Панацея'
where name = 'Панацея';

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
    popularity int unsigned default(0),
    check (popularity >= 0 and popularity <= 100)
);

insert test (price, name, amount, popularity)
VALUES
(5000,'detail1', 40, 30),
(500,'detail2', 40, 30),
(500,'detail3', 350, 100),
(4500,'detail4', 40, 70),
(5000,'detail5', 40, 30),
(1000, null, 40, 30),
(2230,'detail1', null, 0),
(210,'detail2', 21, 30),
(21100,'detail3', null, 30),
(200,'detail5', null, 0);

select distinct test; 

select distinct price, amount from test;

select name
from test
where not name = 'detail1';

select name
from test
where not null;

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
AND popularity < 50 and not null;

select * from test
where name is null or amount is null;

select price as цена, name as Наименование, amount as Количество, popularity as Популярность
from test;












