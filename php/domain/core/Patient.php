<?php


class Patient
{
    private ?int $id;
    private ?string $name;
    private ?string $sex;
    private ?DateTime $date_of_birth;
    private ?string $phone;
    private ?string $diagnosis;
    private ?int $address_id;


    public static function fromAssocArray($arr) : Patient{
        $res = new Patient(null,null,null,null,null,null,null);
        $arr["date_of_birth"] = new DateTime($arr["date_of_birth"]);
        foreach ($arr as $key=>$item){
            $res->$key = $item;
        }
        return $res;
    }

    public function __construct(int|null $id, null|string $name, null|string $sex, DateTime|null $date_of_birth, null|string $phone, null|string $diagnosis, int|null $address_id)
    {
        $this->id = $id;
        $this->name = $name;
        $this->sex = $sex;
        $this->date_of_birth = $date_of_birth;
        $this->phone = $phone;
        $this->diagnosis = $diagnosis;
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

    /**
     * @return string|null
     */
    public function getDiagnosis(): ?string
    {
        return $this->diagnosis;
    }

    /**
     * @param string|null $diagnosis
     */
    public function setDiagnosis(?string $diagnosis): void
    {
        $this->diagnosis = $diagnosis;
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
     * @return DateTime|null
     */
    public function getDateOfBirth(): ?DateTime
    {
        return $this->date_of_birth;
    }

    /**
     * @param DateTime|null $date_of_birth
     */
    public function setDateOfBirth(?DateTime $date_of_birth): void
    {
        $this->date_of_birth = $date_of_birth;
    }

    /**
     * @return string|null
     */
    public function getSex(): ?string
    {
        return $this->sex;
    }

    /**
     * @param string|null $sex
     */
    public function setSex(?string $sex): void
    {
        $this->sex = $sex;
    }
}