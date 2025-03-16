drop database if exists excelsior  ;
create database excelsior;
use excelsior;
drop table if exists Quality_Codes;
-- quality codes table
CREATE TABLE Quality_Codes (
  id INT NOT NULL AUTO_INCREMENT,
  symbolic_code VARCHAR(10) NOT NULL,
  numeric_code float NOT NULL,
  PRIMARY KEY (id)
);
-- publisher table
Drop table if exists Publisher; 
 CREATE TABLE Publisher (
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
    );
    -- role table
         CREATE TABLE Roles (
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
    );
    -- Year table:
	Drop table if exists years;
    CREATE TABLE years (
    ID INT NOT NULL AUTO_INCREMENT,
    release_year INT NOT NULL,
    PRIMARY KEY (ID)
    );
    
    -- comics table
    Drop table if exists Comics;
    CREATE TABLE Comics (
    ID INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    issue_number INT NOT NULL,
    publisher_id INT NOT NULL,
	year_published int not null,
    PRIMARY KEY (ID),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(ID),
    FOREIGN KEY (year_published) REFERENCES years(ID)
    );
        -- characters table:
    Drop table if exists characters;
    CREATE TABLE characters (
    comic_id int not null,
    name VARCHAR(255) NOT NULL,
    publisher_id INT NOT NULL,
        FOREIGN KEY (publisher_id) REFERENCES Publisher(ID),
    FOREIGN KEY (comic_id) REFERENCES Comics(ID)
    );
-- price table
      Drop table if exists price;
     CREATE TABLE price (
    ID INT NOT NULL,
    condition_id INT NOT NULL,
    price DECIMAL(10, 2),
    foreign key (ID) REFERENCES Comics(ID),
    FOREIGN KEY (condition_id) REFERENCES Quality_Codes(ID)
    );  
   
   -- creative team table
      Drop table if exists creative_team;
     CREATE TABLE creative_team (
    ID INT NOT NULL,
    name VARCHAR(255) NOT NULL,
   role_ID INT NOT NULL,
    foreign key (ID) REFERENCES Comics(ID),
    FOREIGN KEY (role_ID) REFERENCES Roles(ID)
    );  
    
    INSERT INTO Quality_Codes (symbolic_code, numeric_code) VALUES   
 ('MT', '10.0'),
('NM', '9.8'),
('VF', '8.0'),
('FN', '6.0'),
('VG', '4.0'),
('GD', '2.2'),
('FR', '1.0'),
('PR', '0.5');
select * from Quality_codes;
INSERT INTO Publisher (name) VALUES ('Marvel Comics'),('DC Comics'),('Image Comics'),('Dark Horse Comics');
INSERT INTO Roles (name) VALUES ('Writer'),('Artist');
INSERT INTO years (release_year) VALUES (1994),(2003),(1940),(1963),(1999),(1996),(1992);
select* from years;
INSERT INTO Comics (title, issue_number, publisher_id, year_published)
Values ('HELLBOY: SEED OF DESTRUCTION',1,4,1),('HELLBOY: SEED OF DESTRUCTION',2,4,1),('HELLBOY: SEED OF DESTRUCTION',3,4,1),('HELLBOY: SEED OF DESTRUCTION',4,4,1),
('Invincible', 1, 3,2),
('Invincible', 2, 3,2),
('Invincible', 3, 3,2),
('Invincible', 11, 3,2),
('Batman', 9, 2,3),('Batman', 10, 2,3),('Batman', 11, 2,3),('Batman', 12, 2,3),('Batman', 643,2,3),('SUPERMAN/BATMAN', 1, 2,2)
,('SUPERMAN/BATMAN', 2, 2,2),
('SUPERMAN/BATMAN', 3, 2,2),('SUPERMAN/BATMAN', 4, 2,2),('X-Men', 1, 1,4),
('Wolverine', 1, 1,2),('AMAZING SPIDER-MAN', 2, 1,5),('JLA', 1, 2,6),('JLA', 2, 2,6),('Spawn', 1, 3,7),('Spawn', 152, 3,7);
select* from comics;
Insert Into characters(comic_id,name,publisher_id) values(1,"Hellboy",4),(2,"Hellboy",4),(3,"Hellboy",4),(4,"Hellboy",4),
(5,"Invincible",3),(6,"Invincible",3),(7,"Invincible",3),(8,"Invincible",3),
(9,"Batman",2),(10,"Batman",2),(11,"Batman",2),(12,"Batman",2),(13,"Batman",2),
(14,"Batman",2),(15,"Batman",2),(16,"Batman",2),(17,"Batman",2),(14,"Superman",2),
(15,"Superman",2),(16,"Superman",2),(17,"Superman",2),(18,"Wolverine",1),(19,"Wolverine",1),(20,"Spiderman",1),
(21,"Batman",2),(21,"Superman",2),(22,"Batman",2),(22,"Superman",2),(23,"Spawn",3),(24,"Spwan",3);
select* from characters;
Insert Into price(ID,Condition_id,price) values(1,7, 21.00),
(1,6, 42.00),
(1,5, 63.00),
(1,4, 105.00),
(1,3, 158.00),
(1,2, 210.00),
(2, 7, 17.50),
(2, 6, 35.00),
(2, 5, 53.00),
(2, 4, 88.00),
(2, 3, 132.00),
(2, 2, 175.00),

(3, 7, 10.50),
(3, 6, 21.00),
(3, 5, 32.00),
(3, 4, 53.00),
(3, 3, 79.00),
(3, 2, 105.00),

(4, 7, 10.50),
(4, 6, 21.00),
(4, 5, 32.00),
(4, 4, 53.00),
(4, 3, 79.00),
(4, 2, 105.00),
( 5, 7, 350.00),
( 5, 6, 700.00),
( 5, 5, 1050.00),
(5, 4, 1750.00),

(6, 7, 70.00),
(6,  6, 140.00),
(6,  5, 210.00),
(6,  4, 350.00),
(6,  2, 700.00),

(7, 7, 44.00),
(7,6, 88.00),
(7,5, 132.00),
(7,4, 219.00),
(7, 3, 320.00),
(7, 2, 438.00),

(8 , 7, 53.00),
(8, 6, 105.00),
(8, 5, 158.00),
(8, 4, 263.00),
(8, 3, 394.00),
(8, 2, 525.00),
(9 , 7, 1664.00),
(9, 6, 3328.00),
(9, 5, 7280.00),
(9, 4, 11440.00),

(10 , 7, 1664.00),
(10, 6, 3328.00),
(10, 5, 7280.00),
(10, 4, 11440.00),


(11 , 7, 3432.00),
(11, 6, 6864.00),
(11, 5, 15015.00),
(11, 4, 23595.00),


(12 , 7, 1248.00),
(12, 6, 2496.00),
(12, 5, 5460.00),
(12, 4, 8580.00),


(13 , 7, 3.00),
(13, 6, 4.00),
(13, 5, 5.25),
(13, 4, 8.75),
(13, 3, 13.50),
(13, 2, 16.00),
(14 , 7, 53.00),
(14, 6, 105.00),
(14, 5, 1515.00),
(14, 4, 263.00),
(14, 3, 394.00),
(14, 2, 525.00),

(15 , 7, 3.50),
(15, 6, 7.00),
(15, 5, 10.50),
(15, 4, 16.00),
(15, 3, 23.25),
(15, 2, 35.00),

(16 , 7, 3.50),
(16, 6, 7.00),
(16, 5, 10.50),
(16, 4, 16.50),
(16, 3, 24.75),
(16, 2, 32.00),

(17 , 7, 3.50),
(17, 6, 7.00),
(17, 5, 10.50),
(17, 4, 17.50),
(17, 3, 27.00),
(17, 2, 34.00),
(18 , 7, 20800.00),
(18, 6, 41600.00),
(18, 5, 83200.00),
(18, 4, 119000.00),
(18, 3, 200000.00),
(19, 5, 8.00),
(19, 4, 12.00),
(19, 3, 20.25),
(19, 2, 23.00),

(20, 4, 43.00),
(20, 3, 64.00),
(20, 2, 88.00),
(21, 4, 43.50),
(21, 3, 64.75),
(21, 2, 85.00),
(22, 4, 17.50),
(22, 3, 27.00),
(22, 2, 35.00),
(23, 4, 80.00),
(23, 3, 113.00),
(23, 2, 150.00),
(24, 4, 70.00),
(24, 3, 102.00),
(24, 2, 136.00);
select*from price;  

Insert into creative_team(ID,name,role_ID)
values (1,'Mike Mignola',1),(1,'Mike Mignola',2),
(2,'Mike Mignola',1),(2,'Mike Mignola',2),
(3,'Mike Mignola',1),(3,'Mike Mignola',2),
(4,'Mike Mignola',1),(4,'Mike Mignola',2),
(5,'Robert Kirkman',1),(5,'Cory Walker',2),
(6,'Robert Kirkman',1),(6,'Cory Walker',2),
(7,'Robert Kirkman',1),(7,'Cory Walker',2),
(8,'Robert Kirkman',1),(8,'Cory Walker',2),
(9,'Bob Kane',1),(9,'Neal Adams',2),
(10,'Bob Kane',1),(10,'Neal Adams',2),
(11,'Bob Kane',1),(11,'Neal Adams',2),
(12,'Bob Kane',1),(12,'Neal Adams',2),
(13,'Bob Kane',1),(13,'Neal Adams',2),
(14,'Jeph Loeb',1),(14,'Micahel Turner',2),
(15,'Jeph Loeb',1),(15,'Micahel Turner',2),
(16,'Jeph Loeb',1),(16,'Micahel Turner',2),
(17,'Jeph Loeb',1),(17,'Micahel Turner',2),
(18,'Jeph Loeb',1),(18,'Micahel Turner',2),
(19,'Stan Lee',1),(19,'Stan Lee',2),
(20,'Greg Rucka',1),(20,'Darick Robertson',2),(21,'Grant Morrison',1),(21,'Howard porter',2),
(22,'Grant Morrison',1),(22,'Howard porter',2),
(23,'Todd McFarlane',1),(23,'Todd McFarlane',2),
(24,'Todd McFarlane',1),(24,'Todd McFarlane',2);
select*from creative_team;



-- PL/SQL query to find all the comics by publisher
Drop procedure if exists comics_publisher;
DELIMITER //
CREATE PROCEDURE comics_publisher (IN publisher_name VARCHAR(255))
BEGIN
    SELECT c.title, c.issue_number, y.release_year, qc.symbolic_code AS condition_code, pr.price
    FROM Comics c
    JOIN Publisher p ON c.publisher_id = p.ID
    JOIN years y ON c.year_published = y.ID
    JOIN price pr ON c.ID = pr.ID
    JOIN Quality_Codes qc ON pr.condition_id = qc.ID
    JOIN characters ch ON c.ID = ch.comic_id
    WHERE p.name = publisher_name;
END //
DELIMITER ;
CALL comics_publisher('Marvel Comics');


-- PL/SQL query to find comics based on specific character on a particular year
Drop procedure if exists find_comics;
DELIMITER //
CREATE PROCEDURE find_comics(IN character_name VARCHAR(255), IN publication_year INT)
BEGIN
  SELECT Comics.title,issue_number,publication_year
  FROM Comics
  INNER JOIN characters ON Comics.ID = characters.comic_id
  INNER JOIN years ON Comics.year_published = years.ID
  WHERE characters.name = character_name
    AND years.release_year = publication_year;
END //
DELIMITER ;

CALL find_comics('Batman', 2003);

-- PL/SQL query to find comics by release year
Drop procedure if exists find_comics_by_year;
DELIMITER //
CREATE PROCEDURE find_comics_by_year(IN publication_year INT)
BEGIN
  SELECT Comics.title,issue_number
  FROM Comics
  INNER JOIN years ON Comics.year_published = years.ID
  WHERE years.release_year = publication_year;
END //
DELIMITER ;
CALL find_comics_by_year(2003);
CALL find_comics_by_year(1996);
-- PL/SQL query to find comics released within a specific range of years
DELIMITER //
Drop procedure if exists comic_range;
CREATE PROCEDURE comic_range (IN start_year INT, IN end_year INT)
BEGIN
    SELECT c.title, c.issue_number, p.name AS publisher_name, y.release_year, qc.symbolic_code AS condition_code, pr.price
    FROM Comics c
    JOIN Publisher p ON c.publisher_id = p.ID
    JOIN years y ON c.year_published = y.ID
    JOIN price pr ON c.ID = pr.ID
    JOIN Quality_Codes qc ON pr.condition_id = qc.ID
    -- JOIN characters ch ON c.ID = ch.comic_id
    -- JOIN Roles r ON ch.publisher_id = r.ID
    WHERE y.release_year BETWEEN start_year AND end_year;
END //

DELIMITER ;
CALL comic_range(1992, 1999);

-- PL/SQL query to find comics where a character has made an appearance

Drop procedure if exists comic_character;
DELIMITER //

CREATE PROCEDURE comic_character (IN character_name VARCHAR(255))
BEGIN
    SELECT c.title, c.issue_number, y.release_year, ch.name AS character_name,p.name AS publisher_name,qc.symbolic_code AS condition_code, pr.price
    FROM Comics c
    JOIN Publisher p ON c.publisher_id = p.ID
    JOIN years y ON c.year_published = y.ID
    JOIN price pr ON c.ID = pr.ID
    JOIN Quality_Codes qc ON pr.condition_id = qc.ID
    JOIN characters ch ON c.ID = ch.comic_id
    WHERE ch.name = character_name;
END //

DELIMITER ;
CALL comic_character('superman');

--  PL/SQL query to find a comic by specific title or characters from lowest to highest price
Drop procedure if exists sorted;
DELIMITER //

CREATE PROCEDURE sorted(IN search VARCHAR(255))
BEGIN
    SELECT c.title, c.issue_number, p.name AS publisher_name, y.release_year, qc.symbolic_code AS condition_code, pr.price
    FROM Comics c
    JOIN Publisher p ON c.publisher_id = p.ID
    JOIN years y ON c.year_published = y.ID
    JOIN price pr ON c.ID = pr.ID
    JOIN Quality_Codes qc ON pr.condition_id = qc.ID
    JOIN characters ch ON c.ID = ch.comic_id
    WHERE c.title LIKE CONCAT('%', search, '%') OR ch.name LIKE CONCAT('%', search, '%')
    ORDER BY pr.price ASC;
END //

DELIMITER ;

CALL sorted('Invincible');
CALL sorted('wolverine');

-- view for different characters that made appearance in same comic book
drop view if exists view1;
CREATE VIEW view1 AS
SELECT DISTINCT c.title, c.issue_number, c.publisher_id
FROM Comics c
JOIN characters c1 ON c.ID = c1.comic_id
JOIN characters c2 ON c.ID = c2.comic_id
WHERE c1.name = 'batman' AND c2.name = 'superman';

select* from view1;

-- view for count of comic book by publishers
drop view if exists view2;
CREATE VIEW view2 AS
SELECT p.name AS publisher_name, COUNT(*) AS comic_count
FROM Comics c
JOIN Publisher p ON c.publisher_id = p.ID
GROUP BY p.name;
select* from view2;

-- view to display Net Worth of comic series
drop view if exists view3;
CREATE VIEW view3 AS
SELECT c.title , SUM(p.price) AS combined_price
FROM Comics c
JOIN price p ON c.ID = p.ID
GROUP BY c.title
ORDER BY SUM(p.price) DESC;
select* from view3;

-- view for  comic books in a very good condition with low price
drop view if exists view4;
CREATE VIEW view4 AS
SELECT Comics.title, Comics.issue_number, Quality_Codes.symbolic_code AS book_condition, MIN(price.price) AS lowest_price
FROM Comics
JOIN price ON Comics.ID = price.ID
JOIN Quality_Codes ON price.condition_id = Quality_Codes.id
WHERE Comics.title LIKE '%Batman%' AND Quality_Codes.symbolic_code = 'VG'
GROUP BY Comics.title, Comics.issue_number, Quality_Codes.symbolic_code;
select* from view4;

-- SQL view to show comic info

drop view if exists comics_info;
CREATE VIEW Comics_Info AS
SELECT c.title, c.issue_number, p.name AS publisher_name, y.release_year, qc.symbolic_code AS condition_code, pr.price
FROM Comics c
JOIN Publisher p ON c.publisher_id = p.ID
JOIN years y ON c.year_published = y.ID
JOIN price pr ON c.ID = pr.ID
JOIN Quality_Codes qc ON pr.condition_id = qc.ID
ORDER BY c.title ASC;

SELECT * FROM comics_info;

-- queries in action
SELECT AVG(price.price) 
FROM price
JOIN Quality_Codes qc ON price.condition_id = qc.ID
WHERE qc.symbolic_code = 'GD';

SELECT ct.name, r.name 
FROM creative_team ct
JOIN Comics c ON ct.ID = c.ID
JOIN Roles r ON ct.role_ID = r.ID
WHERE c.title = 'Invincible' AND c.issue_number = 1;






