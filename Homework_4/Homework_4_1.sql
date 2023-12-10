-- CREATE DATABASE customers_orders;

USE customers_orders;

CREATE TABLE customers
( customer_id int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  favorite_website char(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE orders
( order_id int NOT NULL,
  customer_id int,
  order_date date,
  price int,
  CONSTRAINT orders_pk PRIMARY KEY (order_id)
);

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(4000, 'Jackson', 'Joe', 'techonthenet.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(5000, 'Smith', 'Jane', 'digminecraft.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(6000, 'Ferguson', 'Samantha', 'bigactivities.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(7000, 'Reynolds', 'Allen', 'checkyourmath.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(8000, 'Anderson', 'Paige', NULL);

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(9000, 'Johnson', 'Derek', 'techonthenet.com');

INSERT INTO orders
(order_id, customer_id, order_date, price)
VALUES
(1,7000,'2016-04-18',2000);

INSERT INTO orders
(order_id, customer_id, order_date, price)
VALUES
(2,5000,'2016-04-18',3100);

INSERT INTO orders
(order_id, customer_id, order_date, price)
VALUES
(3,8000,'2016-04-19',2500);

INSERT INTO orders
(order_id, customer_id, order_date, price)
VALUES
(4,4000,'2016-04-20',900);

INSERT INTO orders
(order_id, customer_id, order_date, price)
VALUES
(5,NULL,'2016-05-01',1100);

-- 1.	На основе таблиц ниже, составьте запрос, где стоимость заказов больше 1000 и меньше 3000

SELECT last_name, first_name, favorite_website, order_id, order_date, price FROM customers, orders
WHERE customers.customer_id = orders.customer_id AND price > 1000 AND price < 3000;

-- 2.	На основе таблиц ниже, составьте запрос за весенние месяцы 2016 года
SELECT last_name, first_name, favorite_website, order_id, order_date, price FROM customers, orders
WHERE customers.customer_id = orders.customer_id AND order_date > '2016-03-01' AND order_date < '2016-05-31';

-- 3.	Покажите Пользователей у кого нет заказов
SELECT last_name, first_name, favorite_website FROM
customers LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;


-- DROP TABLE orders;
-- DROP TABLE customers
