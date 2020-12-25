<?php


class Doctor
{
    private ?int $id;
    private ?string $name;
    private ?string $work_place;
    private ?string $phone;
    private ?string $work_address;

    public static function fromAssocArray($arr) : Doctor{
        $res = new Doctor(null,null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct($id,
    ?string $name,
    ?string $work_place,
    ?string $phone,
    ?string $work_address)
    {
        $this->id = $id;
        $this->name = $name;
        $this->work_place = $work_place;
        $this->phone = $phone;
        $this->work_address = $work_address;
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
    public function getName(): ?string
    {
        return $this->name;
    }

    /**
     * @param string|null $name
     */
    public function setName(?string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return string|null
     */
    public function getWorkPlace(): ?string
    {
        return $this->work_place;
    }

    /**
     * @param string|null $work_place
     */
    public function setWorkPlace(?string $work_place): void
    {
        $this->work_place = $work_place;
    }

    /**
     * @return string|null
     */
    public function getPhone(): ?string
    {
        return $this->phone;
    }

    /**
     * @param string|null $phone
     */
    public function setPhone(?string $phone): void
    {
        $this->phone = $phone;
    }

    /**
     * @return string|null
     */
    public function getWorkAddress(): ?string
    {
        return $this->work_address;
    }

    /**
     * @param string|null $work_address
     */
    public function setWorkAddress(?string $work_address): void
    {
        $this->work_address = $work_address;
    }


}