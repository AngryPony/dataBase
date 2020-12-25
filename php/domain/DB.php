<?php
declare(strict_types=1);


class DB{
    private mysqli $mysqli;
    function __construct(){
        $this->mysqli = new mysqli(
            CONFIG['host'],
            CONFIG['user'],
            CONFIG['pass'],
            CONFIG['db']);
        $this->mysqli->query("set names utf8;");
        $this->mysqli->set_charset("utf-8");
    }
    public function readQuery(string $query,?string $types = null,...$params) : array{
        $stmt = $this->mysqli->prepare($query);
        if(!is_null($types))$stmt->bind_param($types,...$params);
        $stmt->execute();
        return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function writeQuery(string $query,?string $types = null,...$params) : void{
        $stmt = $this->mysqli->prepare($query);
        if(!is_null($types))$stmt->bind_param($types,...$params);
        $stmt->execute();
    }
    public function close() : void{
        $this->mysqli->close();
    }

}



?>
