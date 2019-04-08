--DROP CREATE USE--
DROP DATABASE IF EXISTS bay_db;
CREATE DATABASE bay_db;
USE bay_db;

--CREATE TABLE autions( id INT NOT NULL A_I, item_name VARCHAR() NOT NULL, category VARCHAR(), start_bid INT default 0, PRIMARY KEY(id);--
CREATE TABLE autions
(
    id INT NOT NULL
    AUTO_INCREMENT,
    item_name VARCHAR
    (100) NOT NULL,
    category VARCHAR
    (100),
    start_bid INT default 0,
    PRIMARY KEY
    (id);
    );