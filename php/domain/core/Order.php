<?php


class Order
{

    public static function fromAssocArray($arr) : Order{
        $res = new Order(null,null,null,null,null,null,null,null);
        $arr["date_of_creation"] = new DateTime($arr["date_of_creation"]);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }
    private ?int $id;
    private ?string $delivery_address;
    private ?DateTime $date_of_creation;
    private ?int $amount;
    private ?string $status;
    private ?int $patient_id;
    private ?int $pharmacy_id;
    private ?int $type_id;

    public function __construct(?int $id,
    ?string $delivery_address,
    ?DateTime $date_of_creation,
    ?int $amount,
    ?string $status,
    ?int $patient_id,
    ?int $pharmacy_id,
    ?int $type_id)
    {
        $this->id = $id;
        $this->delivery_address = $delivery_address;
        $this->date_of_creation = $date_of_creation;
        $this->amount = $amount;
        $this->status = $status;
        $this->patient_id = $patient_id;
        $this->pharmacy_id = $pharmacy_id;
        $this->type_id = $type_id;
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
     * @return string|null
     */
    public function getDeliveryAddress(): ?string
    {
        return $this->delivery_address;
    }

    /**
     * @param string|null $delivery_address
     */
    public function setDeliveryAddress(?string $delivery_address): void
    {
        $this->delivery_address = $delivery_address;
    }

    /**
     * @return DateTime|null
     */
    public function getDateOfCreation(): ?DateTime
    {
        return $this->date_of_creation;
    }

    /**
     * @param DateTime|null $date_of_creation
     */
    public function setDateOfCreation(?DateTime $date_of_creation): void
    {
        $this->date_of_creation = $date_of_creation;
    }

    /**
     * @return int|null
     */
    public function getAmount(): ?int
    {
        return $this->amount;
    }

    /**
     * @param int|null $amount
     */
    public function setAmount(?int $amount): void
    {
        $this->amount = $amount;
    }

    /**
     * @return string|null
     */
    public function getStatus(): ?string
    {
        return $this->status;
    }

    /**
     * @param string|null $status
     */
    public function setStatus(?string $status): void
    {
        $this->status = $status;
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
    public function getPharmacyId(): ?int
    {
        return $this->pharmacy_id;
    }

    /**
     * @param int|null $pharmacy_id
     */
    public function setPharmacyId(?int $pharmacy_id): void
    {
        $this->pharmacy_id = $pharmacy_id;
    }

    /**
     * @return int|null
     */
    public function getTypeId(): ?int
    {
        return $this->type_id;
    }

    /**
     * @param int|null $type_id
     */
    public function setTypeId(?int $type_id): void
    {
        $this->type_id = $type_id;
    }
}