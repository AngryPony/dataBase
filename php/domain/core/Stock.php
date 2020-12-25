<?php


class Stock
{
    private ?int $id;
    private ?int $amount;
    private ?DateTime $update_date;
    private ?int $pharmacy_id;
    private ?int $storehouse_id;
    private ?int $medicine_id;

    public static function fromAssocArray($arr) : Stock{
        $res = new Stock(null,null,null,null,null,null);
        $arr["update_date"] = new DateTime($arr["update_date"]);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, int|null $amount, DateTime|null $update_date, int|null $pharmacy_id, int|null $storehouse_id, int|null $medicine_id)
    {
        $this->id = $id;
        $this->amount = $amount;
        $this->update_date = $update_date;
        $this->pharmacy_id = $pharmacy_id;
        $this->storehouse_id = $storehouse_id;
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
     * @return DateTime|null
     */
    public function getUpdateDate(): ?DateTime
    {
        return $this->update_date;
    }

    /**
     * @param DateTime|null $update_date
     */
    public function setUpdateDate(?DateTime $update_date): void
    {
        $this->update_date = $update_date;
    }

    /**
     * @return int|null
     */
    public function getStorehouseId(): ?int
    {
        return $this->storehouse_id;
    }

    /**
     * @param int|null $storehouse_id
     */
    public function setStorehouseId(?int $storehouse_id): void
    {
        $this->storehouse_id = $storehouse_id;
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