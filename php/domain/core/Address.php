<?php


class Address
{


    public static function fromAssocArray($arr) : Address{
        $res = new Address(null,null,null,null,null);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    private ?int $id;
    private ?string $city;
    private ?string $street;
    private ?string $build;
    private ?string $zip_code;

    public function __construct(?int $id,
    ?string $city,
    ?string $street,
    ?string $build,
    ?string $zip_code)
    {
        $this->id = $id;
        $this->city = $city;
        $this->street = $street;
        $this->build = $build;
        $this->zip_code = $zip_code;
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getCity(): string
    {
        return $this->city;
    }

    /**
     * @param string $city
     */
    public function setCity(string $city): void
    {
        $this->city = $city;
    }

    /**
     * @return string
     */
    public function getStreet(): string
    {
        return $this->street;
    }

    /**
     * @param string $street
     */
    public function setStreet(string $street): void
    {
        $this->street = $street;
    }

    /**
     * @return string
     */
    public function getBuild(): string
    {
        return $this->build;
    }

    /**
     * @param int $build
     */
    public function setBuild(string $build): void
    {
        $this->build = $build;
    }

    /**
     * @return string
     */
    public function getZipCode(): string
    {
        return $this->zip_code;
    }

    /**
     * @param string $zipCode
     */
    public function setZipCode(string $zipCode): void
    {
        $this->zip_code = $zipCode;
    }
}