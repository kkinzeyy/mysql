--DROP DB IF EX, CREATE, USE--
DROP DATABASE IF EXISTS songs_db;
CREATE songs_db;
USE songs_db;

--CREATE TABLE songs( id INT NOT NULL A_I, title VARCHAR() NULL, artist VARCHAR() NULL, genre VARCHAR() NULL, PRIMARY KEY(id));--
CREATE TABLE songs
(
    id INT NOT NULL
    AUTO_INCREMENT,
    title VARCHAR
    (50) NULL,
    artist VARCHAR
    (50) NULL,
    genre VARCHAR
    (50) NULL,
    PRIMARY KEY
    (id)
);

    --INSERT INTO songs () VALUES();--
    INSERT INTO songs
        (title, artist, genre)
    VALUES('africa', 'toto', 'rock')
    ,
    VALUES
    ('africa','weezer','cover'),
    VALUES
    ('hashpipe','weezer','alternative'),
    VALUES
    ('haspipe','toto','cover');