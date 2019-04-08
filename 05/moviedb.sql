--DROP DATABASE IF EXIST, CREATE DATABASE, USE database--
DROP DATABASE IF EXISTS moviesdb;
CREATE DATABASE moviesdb;
USE moviesdb;

--CREATE TABLEs for database--
CREATE TABLE movies
(
    -- id INTEGER(10) AUTO_INCREMENT NOT NULL, directorId INTEGER(), title VARCHAR(),  PRIMARY KEY (id)--
    id INTEGER(10)
    AUTO_INCREMENT NOT NULL,
    directorId INTEGER
    (10),
    title
    (VARCHAR 50),
    PRIMARY KEY
    (id)
);

    CREATE TABLE directors
    (
        --id INTEGER() AUTO_INCREMENT NOTNULL, firstName VARCHAR(), lastName VARCHAR(), PRIMARY KEY(id)--
        id INTEGER(10)
        AUTO_INCREMENT NOT NULL,
    firstName VARCHAR
        (50),
    lastName VARCHAR
        (50),
    PRIMARY KEY
        (ID)
);

        --INSERT INTO directors(firstName,LastName) VALUES ('','');--
        INSERT INTO directors
            (firstName,LastName)
        VALUES
            ('jon', 'smith');
        INSERT INTO directors
            (firstName,LastName)
        VALUES
            ('erin', 'ortega');
        INSERT INTO directors
            (firstName,LastName)
        VALUES
            ('tommy', 'jones');

        --INSERT INTO movies(title, directorId) VALUES ('', 0);--
        INSERT INTO movies
            (title, directorId)
        VALUES
            ('xmen', 1);
        INSERT INTO movies
            (title, directorId)
        VALUES
            ('skyfall', 2);
        INSERT INTO movies
            (title, directorId)
        VALUES
            ('spiderman', 3);
        INSERT INTO movies
            (title, directorId)
        VALUES
            ('movietitle', NULL);

        --SELECT * FROM ;--
        SELECT *
        FROM movies;
        SELECT *
        FROM directors;

        --SELECT '', FROM db--
        --show all movies with directors--
        SELECT title, firstName, lastName
        FROM movies
            --INNER JOIN returns matching VALUES from both tables--
            INNER JOIN directors ON movies.directorId = directorId.id;

        --show all movies even with out directorId--
        SELECT title, firstName, lastName
        FROM movies
            --LEFT JOIN returns all of the values from the LEFT table and matching from the right
            LEFT JOIN directors ON movies.directorId = directors.id;
        --same thing but for RIGHT JOIN--
        SELECT title, firstName, lastName
        FROM movies
            RIGHT JOIN directors ON movies.directorId = directors.id;