
CREATE DATABASE IF NOT EXISTS myAiroport;

Use myAiroport;

CREATE TABLE IF NOT EXISTS country (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS city (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) not null,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id)
		REFERENCES country (id)
);

CREATE TABLE IF NOT EXISTS airoport (
    code INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) not null,
    type ENUM('INTL', 'DOM') not null,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id)
        REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS gate (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name INT NOT NULL,
    type ENUM('SMALL', 'LARGE', 'MEDIUM') NOT NULL,
    airoport_code INT NOT NULL,
    FOREIGN KEY (airoport_code)
        REFERENCES airoport (code)
);

 CREATE TABLE IF NOT EXISTS plane (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    model VARCHAR(45) NOT NULL,
    taiNumber INT NOT NULL
);   

CREATE TABLE IF NOT EXISTS flight (
    number INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ind ENUM('REGULAR', 'ADDITIONAL', 'SPECIAL', 'CHARTER') NOT NULL,
    type ENUM('NON-STOP', 'DOCKING', 'STRAIGHT') NOT NULL,
    status ENUM('WAIT', 'DONE', 'CANCEL') NOT NULL,
    arrivalDate DATETIME NOT NULL,
    departureDate DATETIME NOT NULL,
    distance INT NOT NULL,
    gate_id INT NOT NULL,
    plane_id INT NOT NULL,
    FOREIGN KEY (gate_id)
        REFERENCES gate (id),
    FOREIGN KEY (plane_id)
        REFERENCES plane (id)
);
    
  CREATE TABLE IF NOT EXISTS sit (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    number INT NOT NULL,
    class ENUM('A', 'B', 'C') NOT NULL,
    `row` ENUM('1', '2', '3') NOT NULL,
    costRatio DOUBLE NOT NULL,
    plane_id INT NOT NULL,
	FOREIGN KEY (plane_id)
        REFERENCES plane (id)
);    

  CREATE TABLE IF NOT EXISTS discount (
    discountCode INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(45) NOT NULL,
    desription TEXT(255) NOT NULL,
    amount INT ZEROFILL UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS baggage (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	weight DOUBLE ZEROFILL UNSIGNED NOT NULL,
	volume DOUBLE ZEROFILL UNSIGNED NOT NULL,
	type ENUM("CARRYON", "SUITCASE", "ANIMAL") NOT NULL
    );
    
  CREATE TABLE IF NOT EXISTS ticket (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    purchaseDate DATETIME NOT NULL,
    flightNumber INT UNSIGNED NOT NULL,
    planeModel VARCHAR(45) NOT NULL,
    sitNumber INT UNSIGNED NOT NULL,
    baggageWeight DOUBLE UNSIGNED ZEROFILL NOT NULL,
    sit_id INT NOT NULL,
    sales_discountCode INT NOT NULL,
    baggage_id INT NOT NULL,
    FOREIGN KEY (sit_id)
        REFERENCES sit (id),
    FOREIGN KEY (sales_discountCode)
        REFERENCES discount (discountCode),
    FOREIGN KEY (baggage_id)
        REFERENCES baggage (id)
);
  
  CREATE TABLE IF NOT EXISTS client (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FIO VARCHAR(255) NOT NULL,
    passportData VARCHAR(100) NOT NULL,
    age INT UNSIGNED NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    account VARCHAR(45) NOT NULL,
    ticket_id INT NOT NULL,
    FOREIGN KEY (ticket_id)
        REFERENCES ticket (id)
)


   

    
  
    
    
    