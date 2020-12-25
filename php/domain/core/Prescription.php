<?php


class Prescription
{

    private ?int $id;
    private ?DateTime $discharge_date;
    private ?DateTime $expiration_date;
    private ?int $doctor_id;
    private ?int $patient_id;
    private ?int $medicine_id;

    public static function fromAssocArray($arr) : Prescription{
        $res = new Prescription(null,null,null,null,null,null);
        $arr["discharge_date"] = new DateTime($arr["discharge_date"]);
        $arr["expiration_date"] = new DateTime($arr["expiration_date"]);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, DateTime|null $discharge_date, DateTime|null $expiration_date, int|null $doctor_id, int|null $patient_id, int|null $medicine_id)
    {
        $this->id = $id;
        $this->discharge_date = $discharge_date;
        $this->expiration_date = $expiration_date;
        $this->doctor_id = $doctor_id;
        $this->patient_id = $patient_id;
        $this->medicine_id = $medicine_id;
    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @param int|null $id
     */
    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return DateTime|null
     */
    public function getDischargeDate(): ?DateTime
    {
        return $this->discharge_date;
    }

    /**
     * @param DateTime|null $discharge_date
     */
    public function setDischargeDate(?DateTime $discharge_date): void
    {
        $this->discharge_date = $discharge_date;
    }

    /**
     * @return DateTime|null
     */
    public function getExpirationDate(): ?DateTime
    {
        return $this->expiration_date;
    }

    /**
     * @param DateTime|null $expiration_date
     */
    public function setExpirationDate(?DateTime $expiration_date): void
    {
        $this->expiration_date = $expiration_date;
    }

    /**
     * @return int|null
     */
    public function getDoctorId(): ?int
    {
        return $this->doctor_id;
    }

    /**
     * @param int|null $doctor_id
     */
    public function setDoctorId(?int $doctor_id): void
    {
        $this->doctor_id = $doctor_id;
    }

    /**
     * @return int|null
     */
    public function getPatientId(): ?int
    {
        return $this->patient_id;
    }

    /**
     * @param int|null $patient_id
     */
    public function setPatientId(?int $patient_id): void
    {
        $this->patient_id = $patient_id;
    }

    /**
     * @return int|null
     */
    public function getMedicineId(): ?int
    {
        return $this->medicine_id;
    }

    /**
     * @param int|null $medicine_id
     */
    public function setMedicineId(?int $medicine_id): void
    {
        $this->medicine_id = $medicine_id;
    }
}