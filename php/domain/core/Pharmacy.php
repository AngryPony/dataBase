<?php


class Pharmacy
{
    private ?int $id;
    private ?string $name;
    private ?string $phone;
    private ?int $address_id;

    public static function fromAssocArray($arr) : Pharmacy{
        $res = new Pharmacy(null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, null|string $name, null|string $phone, int|null $address_id)
    {
        $this->id = $id;
        $this->name = $name;
        $this->phone = $phone;
        $this->address_id = $address_id;
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
     * @return int|null
     */
    public function getAddressId(): ?int
    {
        return $this->address_id;
    }

    /**
     * @param int|null $address_id
     */
    public function setAddressId(?int $address_id): void
    {
        $this->address_id = $address_id;
    }
}