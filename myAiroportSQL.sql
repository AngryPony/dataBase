
CREATE DATABASE IF NOT EXISTS myAiroport;

Use myAiroport;

CREATE TABLE IF NOT EXISTS country (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS city (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name VARCHAR(45) not null,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id)
		REFERENCES country (id)
);

CREATE TABLE IF NOT EXISTS airoport (
    code INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name VARCHAR(45) not null,
    type ENUM('INTL', 'DOM') not null,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id)
        REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS gate (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    name INT NOT NULL,
    type ENUM('SMALL', 'LARGE', 'MEDIUM') NOT NULL ,
    airoport_code INT NOT NULL,
    FOREIGN KEY (airoport_code)
        REFERENCES airoport (code)
);

 CREATE TABLE IF NOT EXISTS plane (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    model VARCHAR(45) NOT NULL,
    tailNumber INT NOT NULL
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
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
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
    age INT UNSIGNED NOT NULL CHECK (age > 0 AND age < 102),
    gender ENUM('M', 'F') NOT NULL,
    account VARCHAR(45) NOT NULL,
    ticket_id INT NOT NULL,
    FOREIGN KEY (ticket_id)
        REFERENCES ticket (id)
);

ALTER TABLE country 
ADD shortname varchar(10) AFTER name;

ALTER TABLE country 
ADD place int NULL after shortname;

ALTER TABLE country 
MODIFY COLUMN place CHAR(45);

ALTER TABLE country 
ALTER COLUMN place SET DEFAULT "Hello World!";

ALTER TABLE country
DROP COLUMN place;

CREATE TABLE IF NOT EXISTS test (
id int not null,
testing int null
);

ALTER TABLE test
ADD primary key (id);

ALTER TABLE test
DROP primary key;

DROP TABLE test;

INSERT baggage (weight, volume, type)
VALUES
(20.0,21.0,'SUITCASE'),
(16.9,2.0,'ANIMAL'),
(15.5,0.0,'ANIMAL'),
(8.0,8.8,'SUITCASE');

INSERT country (name, shortname)
VALUES
('RUSSIAN', 'RUS'),
('England', null),
('America', 'USA');

INSERT plane (model, tailNumber)
VALUES
('AH-112', '9109'),
('GHaT','0001'),
('MiG17', '981213');

CREATE TABLE Test (
	once int null
    );

ALTER TABLE Test RENAME reviews;
RENAME TABLE reviews TO imagination;
RENAME TABLE imagination TO NOimagination;

ALTER TABLE NOimagination
ADD hard boolean DEFAULT TRUE;

ALTER TABLE NOimagination
ADD justZero char DEFAULT 1;

ALTER TABLE NOimagination CHANGE COLUMN hard impossible char(5) DEFAULT 'YES';





    
  
    
    
    