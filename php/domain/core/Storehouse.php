<?php


class Storehouse
{

    private ?int $id;
    private ?string $name;
    private ?string $type;
    private ?int $delivery_time;

    public static function fromAssocArray($arr) : Storehouse{
        $res = new Storehouse(null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, null|string $name, null|string $type, int|null $delivery_time)
    {
        $this->id = $id;
        $this->name = $name;
        $this->type = $type;
        $this->delivery_time = $delivery_time;
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
    public function getType(): ?string
    {
        return $this->type;
    }

    /**
     * @param string|null $type
     */
    public function setType(?string $type): void
    {
        $this->type = $type;
    }

    /**
     * @return int|null
     */
    public function getDeliveryTime(): ?int
    {
        return $this->delivery_time;
    }

    /**
     * @param int|null $delivery_time
     */
    public function setDeliveryTime(?int $delivery_time): void
    {
        $this->delivery_time = $delivery_time;
    }
}