<?php


class Reviews
{
    private ?int $id;
    private ?string $quality_of_service;
    private ?string $reasonable_price;
    private ?string $delivery_speed;
    private ?string $delivery_quality;
    private ?string $wishes;
    private ?int $patient_id;

    public static function fromAssocArray($arr) : Reviews{
        $res = new Reviews(null,null,null,null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, null|string $quality_of_service, null|string $reasonable_price, null|string $delivery_speed, null|string $delivery_quality, null|string $wishes, int|null $patient_id)
    {
        $this->id = $id;
        $this->quality_of_service = $quality_of_service;
        $this->reasonable_price = $reasonable_price;
        $this->delivery_speed = $delivery_speed;
        $this->delivery_quality = $delivery_quality;
        $this->wishes = $wishes;
        $this->patient_id = $patient_id;
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
    public function getQualityOfService(): ?string
    {
        return $this->quality_of_service;
    }

    /**
     * @param string|null $quality_of_service
     */
    public function setQualityOfService(?string $quality_of_service): void
    {
        $this->quality_of_service = $quality_of_service;
    }

    /**
     * @return string|null
     */
    public function getReasonablePrice(): ?string
    {
        return $this->reasonable_price;
    }

    /**
     * @param string|null $reasonable_price
     */
    public function setReasonablePrice(?string $reasonable_price): void
    {
        $this->reasonable_price = $reasonable_price;
    }

    /**
     * @return string|null
     */
    public function getDeliverySpeed(): ?string
    {
        return $this->delivery_speed;
    }

    /**
     * @param string|null $delivery_speed
     */
    public function setDeliverySpeed(?string $delivery_speed): void
    {
        $this->delivery_speed = $delivery_speed;
    }

    /**
     * @return string|null
     */
    public function getDeliveryQuality(): ?string
    {
        return $this->delivery_quality;
    }

    /**
     * @param string|null $delivery_quality
     */
    public function setDeliveryQuality(?string $delivery_quality): void
    {
        $this->delivery_quality = $delivery_quality;
    }

    /**
     * @return string|null
     */
    public function getWishes(): ?string
    {
        return $this->wishes;
    }

    /**
     * @param string|null $wishes
     */
    public function setWishes(?string $wishes): void
    {
        $this->wishes = $wishes;
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
}