--DROP DB IF EX, CREATE, USE--
DROP DATABASE IF EXISTS tea_db;
CREATE tea_db;
USE tea_db;

--CREATE TABLE flavors(id INT NOT NULL A_I, flavor VARCHAR() NULL, price DECIMAL(10,2) NULL, quantity INT NULL, PRIMARY KEY (id));--
CREATE TABLE flavors
(
    id INT NOT NULL
    AUTO_INCREMENT, 
    flavor VARCHAR
    (15) NULL,
    price DECIMAL
    (10,2) NULL,
    quantity INT NULL,
    PRIMARY KEY
    (id)
    );

    --INSERT INTO flavors () VALUES();--
    INSERT INTO flavors
        (flavor, price, quantity)
    VALUES
        ('green', 2.00, 500),
        ('mango', 2.50, 300),
        ('blueberry-green', 2.75, 600);
  
