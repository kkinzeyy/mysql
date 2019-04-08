-- database commands are supposed to be in all caps --
-- "DROP DATABASE IF EXIST"  if there is already a database with that name it ERASES THE CONTENT -- 
DROP DATABASE IF EXISTS animaldb;
-- CREATE DATABASE actually creates the database if one does not exist --
CREATE DATABASE animaldb;

-- USE applies all of the current code that we are creating for the database --
USE animaldb;

-- CREATE TABLE creates a table on the database that we can insert data into --
CREATE TABLE animalsInZoo
(
    --create a string input for a column for "name" that cannot be left empty--
    name VARCHAR(15) NOT NULL,
    --create another column with a boolean value that cannot be left empty--
    in_captivity BOOLEAN NOT NULL,
    --create a column for a string input for "nickname"--
    nick_name VARCHAR(10),
    --create a column for an integer input for animal "age"--
    age INTEGER(3)
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
WHERE name = 'tiger'