-- Active: 1704884898003@@127.0.0.1@3306@minip
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(225),
    category VARCHAR(225),
    price DECIMAL,
    stockQuantity INT);

    CREATE TABLE customer(
        customer_id INT PRIMARY KEY AUTO_INCREMENT,
        firstname VARCHAR(225),
        lastname VARCHAR(225),
        email VARCHAR(225) UNIQUE,
        phone INT);

        CREATE TABLE orders(
            order_id INT  PRIMARY KEY AUTO_INCREMENT,
            order_date DATE,
            customer_id_fk INT,
            -- The constraint link the customers table to order table
            constraint customer_orders FOREIGN KEY (customer_id_fk) REFERENCES customer(customer_id));

            CREATE TABLE orderDetails(
                orderDetail_id INT PRIMARY key AUTO_INCREMENT,
                order_id_fk INT,
                --This constraint link the orderDetails table to the orders table
                constraint orders_orderDetails FOREIGN KEY (order_id_fk) REFERENCES orders(order_id),
                product_id_fk INT,
                --This constraint link the product table to the orderDetails table
                constraint product_orderDetails FOREIGN KEY (product_id_fk) REFERENCES product(product_id),
                quantity INT,
                total_price DECIMAL);

                SELECT * FROM orderdetails;

                --Insert data into the product table
                INSERT INTO product(product_name,category,price,stockQuantity)
                VALUES('washing machine','Home applicance','150000',5);

                SELECT * FROM product;

                --Insert data into the customer table
                INSERT INTO customer(firstname,lastname,email,phone)
                VALUES('Tolu','Adesanya','Tolu@gmail.com',1234567);

                SELECT * FROM customer;

                --Insert data into orders table
                INSERT INTO orders(order_date,customer_id_fk)
                VALUES(CURDATE(),2);

                SELECT * FROM orders;

                --Insert data into orderDetails
                INSERT INTO orderdetails(order_id_fk,product_id_fk,quantity,total_price)
                VALUES(3,1,2,'300000');

                SELECT * FROM orderdetails;

                SELECT * FROM customer INNER JOIN orders ON customer.customer_id = orders.customer_id_fk;

                --View that shows the details of the customer orders
                CREATE View total_orders AS
                SELECT sum(total_price)  AS total_price, order_id_fk,order_date,product_id_fk,quantity 
                FROM orderdetails,orders GROUP BY order_id_fk;

                SELECT * FROM total_orders;