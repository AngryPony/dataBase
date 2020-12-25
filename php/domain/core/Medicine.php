<?php


class Medicine
{

    public static function fromAssocArray($arr) : Medicine{
        $res = new Medicine(null,null,null,null,null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    private ?int $id;
    private ?string $type;
    private ?string $way_of_using;
    private ?string $name;
    private ?string $provider;
    private ?string $dispensing_method;
    private ?int $price;
    private ?int $critical_limits;

    public function __construct(?int $id,
    ?string $type,
    ?string $way_of_using,
    ?string $name,
    ?string $provider,
    ?string $dispensing_method,
    ?int $price,
    ?int $critical_limits)
    {
        $this->id = $id;
        $this->type = $type;
        $this->way_of_using = $way_of_using;
        $this->name = $name;
        $this->provider = $provider;
        $this->dispensing_method = $dispensing_method;
        $this->price = $price;
        $this->critical_limits = $critical_limits;
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
     * @return string|null
     */
    public function getWayOfUsing(): ?string
    {
        return $this->way_of_using;
    }

    /**
     * @param string|null $way_of_using
     */
    public function setWayOfUsing(?string $way_of_using): void
    {
        $this->way_of_using = $way_of_using;
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
    public function getProvider(): ?string
    {
        return $this->provider;
    }

    /**
     * @param string|null $provider
     */
    public function setProvider(?string $provider): void
    {
        $this->provider = $provider;
    }

    /**
     * @return string|null
     */
    public function getDispensingMethod(): ?string
    {
        return $this->dispensing_method;
    }

    /**
     * @param string|null $dispensing_method
     */
    public function setDispensingMethod(?string $dispensing_method): void
    {
        $this->dispensing_method = $dispensing_method;
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

    /**
     * @return int|null
     */
    public function getCriticalLimits(): ?int
    {
        return $this->critical_limits;
    }

    /**
     * @param int|null $critical_limits
     */
    public function setCriticalLimits(?int $critical_limits): void
    {
        $this->critical_limits = $critical_limits;
    }

}