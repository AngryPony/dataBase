<?php


class OrderType
{

    public static function fromAssocArray($arr) : OrderType{
        $res = new OrderType(null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }
    private ?int $id;
    private ?string $name;
    private ?int $price;

    public function __construct(int|null $id, null|string $name, int|null $price)
    {
        $this->id = $id;
        $this->name = $name;
        $this->price = $price;
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
     * @return int|null
     */
    public function getPrice(): ?int
    {
        return $this->price;
    }

    /**
     * @param int|null $price
     */
    public function setPrice(?int $price): void
    {
        $this->price = $price;
    }


}