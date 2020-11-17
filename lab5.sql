/* Index */
use apteka;

/* Выбор по индексу */
create index amount on stock(Amount) ;

select * from stock where amount < 500;
drop index amount on stock; 

/* Сортировка */
create index fio on patient(FIO);

select * from patient
order by fio;
drop index fio on patient;

/* Уникальные индексы */
create unique index phone on patient(phone); /* остановится после обнаружения первого соответствия. 
											В случае обычного индекса будет обязательно проведена еще одна проверка */

select * from patient
where phone = '+7 (956) 936-93-40';