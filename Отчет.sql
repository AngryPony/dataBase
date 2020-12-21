use apteka;

select doctor.fio as 'Врач', patient.FIO as 'Пациент', medicine.name, max(stock.Amount) as 'Максимальный запас', storehouse.name as 'Место хранения' 
from doctor
	join prescription on doctor.idDoctor = prescription.doctor_idDoctor 
    join patient on prescription.patient_idPatient = patient.idPatient
    join medicine on prescription.medicine_idmedicine1 = medicine.idmedicine
    
    join stock on medicine.idmedicine = stock.medicine_idmedicine
    
    join storehouse on stock.storehouse_idstorehouse = storehouse.idstorehouse
    
where doctor.FIO = 'Отчет'
group by (patient.FIO)
order by (max(stock.Amount)) desc;


select FIO, name as 'Лекарство', price
from doctor
	join prescription on doctor.idDoctor = prescription.doctor_idDoctor
    join medicine on prescription.medicine_idmedicine1 = medicine.idmedicine
order by (medicine.Price) desc
limit 3;

select FIO, phone, name , Amount, Price, (`order`.amount * medicine.Price) as TotalSum
from patient
	join `order` on patient.idPatient = `order`.patient_idPatient
    join order_has_medicine on order_has_medicine.order_idorder = `order`.idorder
    join medicine on order_has_medicine.medicine_idmedicine = medicine.idmedicine
where FIO = 'Королёв Леонард Антонинович';



   