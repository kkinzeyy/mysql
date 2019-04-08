-- database commands are supposed to be in all caps --
-- "DROP DATABASE IF EXIST"  if there is already a database with that name it ERASES THE CONTENT -- 
DROP DATABASE IF EXISTS programdb;
-- CREATE DATABASE actually creates the database if one does not exist --
CREATE DATABASE programdb;

--USE the correct databse--
USE programdb;

--CREATE the TABLE--
CREATE TABLE program_lang
(

    --create a INTEGER column called "id" to AUTO_INCREMENT its default value as we create new rows--
    id INTEGER
(10)
    AUTO_INCREMENT NOT NULL,
    --create string input for column for 'LANGUAGE' that will be NOT NULL--
    LANGUAGE VARCHAR
    (15) NOT NULL,
    --create a 'rating' column for INTEGER(10)--
    rating INTEGER
    (10),
    --create a column with a BOOLEAN value DEFAULT TRUE--
    mastered BOOLEAN DEFAULT TRUE,
    --set the id as the PRIMARY KEY--
    PRIMARY KEY
    (id)
);

    --INSERT VALUES INTO rows--
    INSERT INTO program_lang
        (LANGUAGE, rating)
    VALUES
        ('JAVASCRIPT', 80);

    INSERT INTO program_lang
        (LANGUAGE, rating)
    VALUES
        ('HTML', 90);INSERT INTO program_lang
        (LANGUAGE, rating)
    VALUES
        ('CSS', 70);
    INSERT INTO program_lang
        (LANGUAGE, rating)
    VALUES
        ('MYSQL', 65);