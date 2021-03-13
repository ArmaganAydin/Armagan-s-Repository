CREATE DATABASE Practice;
USE Practice;
DROP DATABASE Practice;

CREATE TABLE personal_info (
    first_name VARCHAR (50) PRIMARY KEY,
    last_name VARCHAR (50) NOT NULL,
    birth_date DATE,
    sex VARCHAR (50),
    degree VARCHAR (50),
    field VARCHAR (50),
    experience_1 VARCHAR (50),
    experience_2 VARCHAR (50),
    experience_3 VARCHAR (50),
    interest_1 VARCHAR (50),
    interest_2 VARCHAR (50),
    interest_3 VARCHAR (50),
    hobbies_1 VARCHAR (50),
    hobbies_2 VARCHAR (50) DEFAULT 'Reading'
);

DESCRIBE personal_info;

DROP TABLE personal_info;

ALTER TABLE personal_info ADD any_number DECIMAL (2, 1);

ALTER TABLE personal_info DROP COLUMN any_number;

CREATE TABLE physical_appearance (
    height INT PRIMARY KEY,
    weight INT,
    hair_color VARCHAR (50),
    eye_color VARCHAR (50),
    name VARCHAR (50),
    FOREIGN KEY (name) REFERENCES personal_info(first_name) ON DELETE CASCADE
);

DROP TABLE physical_appearance;

INSERT INTO personal_info VALUES ('Armagan', 'Aydin', '1997-07-17', 'M',
'Bachelor','Aviation Management', 'TAV IST Airpot Intern',
'Entrepreneurship CANZIK', 'IGA IST Airport Intern', 'Analytics',
'Aviation', 'Entrepreneursip', 'Music', 'Research');

INSERT INTO physical_appearance VALUES (172, 70, 'Blonde','Blue', 'Armagan');


SELECT * FROM personal_info;

SELECT * FROM physical_appearance;

SELECT first_name AS forename, last_name AS surname FROM personal_info;

SELECT * FROM personal_info ORDER BY birth_date DESC;

SELECT * FROM personal_info ORDER BY first_name, last_name, birth_date; 

SELECT * FROM personal_info LIMIT 1;

SELECT interest_1, interest_2, interest_3 FROM personal_info;

SELECT interest_1 AS int_1, interest_2 AS int_2, interest_3 AS int_3 FROM personal_info;

SELECT DISTINCT degree FROM personal_info;

SELECT COUNT(first_name) FROM personal_info;

SELECT COUNT(first_name) FROM personal_info
WHERE sex = 'M' AND birth_date > '1997-01-01';

SELECT AVG(height) FROM physical_appearance;

SELECT SUM(Weight) FROM physical_appearance;

SELECT COUNT (sex), sex FROM personal_info 
GROUP BY sex;

SELECT * FROM personal_info WHERE field LIKE '%Aviation Management';

SELECT * FROM personal_info WHERE birth_date LIKE '____-07%';

SELECT birth_date FROM personal_info
UNION
SELECT weight FROM physical_appearance;

SELECT personal_info.first_name, physical_appearance.name
FROM personal_info
INNER JOIN physical_appearance
ON personal_info.first_name = physical_appearance.name;

SELECT hair_color
FROM physical_appearance
WHERE eye_color LIKE 'Blue';

SELECT first_name, last_name FROM personal_info
WHERE first_name IN (
    SELECT hair_color
FROM physical_appearance
WHERE eye_color LIKE 'Blue'
);