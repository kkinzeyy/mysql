--DROPS animaldb since it currently exist--
DROP DATABASE IF EXISTS animaldb;
--CREATEs the 'animaldb' DATABASE--
CREATE DATABASE animaldb;

--USE the correct datebase--
USE animaldb;

--CREATEs the TABLE--
CREATE TABLE animalsInZoo
(
    --create a colum for an INTEGER for 'id' that will AUTO_INCREMENT and will NOT be NULL-
    id INTEGER(10)
    AUTO_INCREMENT NOT NULL,
    --create string input for column for 'NAME' that will be NOT NULL--
    name VARCHAR
    (15) NOT NULL,
    --create a column with a BOOLEAN NOT NULL value--
    in_captivity BOOLEAN NOT NULL DEFAULT TRUE,
    --create a string column for 'nickname'--
    nick_name VARCHAR
    (10),
    --create a INTEGER column for 'age'--
    age INTEGER
    (3),
    --set the id as the PRIMARY KEY--
    PRIMARY KEY
    (id)
);

    --INSERT VALUES INTO rows with the corresponding columns--
    INSERT INTO animalsInZoo
        (name, in_captivity, nick_name, age)
    VALUES
        ('elephant', TRUE, "ellie", 24);

    INSERT INTO animalsInZoo
        (name, in_captivity, nick_name, age)
    VALUES
        ('crocodile', TRUE, "carter", 20);

    INSERT INTO animalsInZoo
        (name, in_captivity, nick_name, age)
    VALUES
        ('lion', TRUE, "lionel", 16);

    INSERT INTO animalsInZoo
        (name, in_captivity)
    VALUES
        ('tiger', FALSE);

    --UPDATE the row for 'tiger' to in_captivity--
    --updating the table--
    UPDATE animalsInZoo
--changing the value of FLASE to TRUE, adding additional information to the row--
SET in_captivity = TRUE, nick_name = 'tony', age = 30
--selecting the row WHERE the update needs to be applied to--
WHERE id = 4;
    -- * is the wild card and means 'all'--
    SELECT *
    FROM animalsInZoo;