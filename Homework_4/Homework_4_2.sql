CREATE DATABASE IF NOT EXISTS calls;

USE calls;


CREATE TABLE call_orders (
    id int  NOT NULL AUTO_INCREMENT,
    employee_id int  NOT NULL,
    customer_id int  NOT NULL,
    start_time datetime  NOT NULL,
    end_time datetime  NULL,
    call_orders_outcome_id int  NULL,
    CONSTRAINT call_orders_ak_1 UNIQUE (employee_id, start_time),
    CONSTRAINT call_orders_pk PRIMARY KEY  (id)
);


CREATE TABLE call_orders_outcome (
    id int  NOT NULL AUTO_INCREMENT,
    outcome_text varchar(128)  NOT NULL,
    CONSTRAINT call_orders_outcome_ak_1 UNIQUE (outcome_text),
    CONSTRAINT call_orders_outcome_pk PRIMARY KEY  (id)
);


CREATE TABLE customer (
    id int  NOT NULL AUTO_INCREMENT,
    customer_name varchar(255)  NOT NULL,
    city_id int  NOT NULL,
    customer_address varchar(255)  NOT NULL,
    next_call_orders_date date  NULL,
    ts_inserted datetime  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY  (id)
);


CREATE TABLE employee (
    id int  NOT NULL AUTO_INCREMENT,
    first_name varchar(255)  NOT NULL,
    last_name varchar(255)  NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY  (id)
);


ALTER TABLE call_orders ADD CONSTRAINT call_orders_call_orders_outcome
    FOREIGN KEY (call_orders_outcome_id)
    REFERENCES call_orders_outcome (id);


ALTER TABLE call_orders ADD CONSTRAINT call_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (id);


ALTER TABLE call_orders ADD CONSTRAINT call_orders_employee
    FOREIGN KEY (employee_id)
    REFERENCES employee (id);


-- Foreign key constraint 'customer_city' is referencing a 'city' table that hasn't been defined in your provided code.


INSERT INTO call_orders_outcome (outcome_text) VALUES ('call_orders started');
INSERT INTO call_orders_outcome (outcome_text) VALUES ('finished - successfully');
INSERT INTO call_orders_outcome (outcome_text) VALUES ('finished - unsuccessfully');


INSERT INTO employee (first_name, last_name) VALUES ('Thomas (Neo)', 'Anderson');
INSERT INTO employee (first_name, last_name) VALUES ('Agent', 'Smith');


INSERT INTO customer (customer_name, city_id, customer_address, next_call_orders_date, ts_inserted) VALUES ('Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_orders_date, ts_inserted) VALUES ('Bakery', 1, 'Kurfürstendamm 25', '2020-02-21', '2020-01-09 17:52:15');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_orders_date, ts_inserted) VALUES ('Café', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_orders_date, ts_inserted) VALUES ('Restaurant', 3, 'Ulica lipa 15', '2020-01-21', '2020-01-10 09:20:21');


INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 4, '2020-01-11 09:00:15', '2020-01-11 09:12:22', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 2, '2020-01-11 09:14:50', '2020-01-11 09:20:01', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (2, 3, '2020-01-11 09:02:20', '2020-01-11 09:18:05', 3);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 1, '2020-01-11 09:24:15', '2020-02-11 09:25:05', 3);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 3, '2020-01-11 09:26:23', '2020-03-11 09:33:45', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 2, '2020-01-11 09:40:31', '2020-01-12 09:42:32', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (2, 4, '2020-01-11 09:41:17', '2020-01-15 09:45:21', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (1, 1, '2020-01-11 09:42:32', '2020-01-11 09:46:53', 3);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (2, 1, '2020-01-11 09:46:00', '2020-01-11 09:48:02', 2);
INSERT INTO call_orders (employee_id, customer_id, start_time, end_time, call_orders_outcome_id) VALUES (2, 2, '2020-01-11 09:50:12', '2020-01-11 09:55:35', 2);


-- На основе таблиц ниже, составьте запрос, где будет показываться звонки за 2020/1/11  и всех покупателям с фамилией на B

SELECT first_name, last_name, start_time, end_time, customer_name, customer_address, next_call_orders_date, ts_inserted, outcome_text FROM 
call_orders JOIN customer ON call_orders.customer_id = customer.id
JOIN employee ON call_orders.employee_id = employee.id
JOIN call_orders_outcome ON call_orders.call_orders_outcome_id = call_orders_outcome.id
WHERE call_orders.start_time between '2020-1-11 00:00:00' and '2020-1-11 23:59:59'
AND call_orders.end_time between '2020-1-11 00:00:00' and '2020-1-11 23:59:59'
AND customer.customer_name LIKE "B%";

-- На основе таблиц ниже, составьте запрос кому звонил Thomas 

SELECT first_name, last_name, start_time, end_time, customer_name, customer_address, next_call_orders_date, ts_inserted, outcome_text FROM 
call_orders JOIN customer ON call_orders.customer_id = customer.id
JOIN employee ON call_orders.employee_id = employee.id
JOIN call_orders_outcome ON call_orders.call_orders_outcome_id = call_orders_outcome.id
WHERE employee.first_name LIKE "Thomas%";

-- показы у кого были завершены звонки успешно 
SELECT first_name, last_name, start_time, end_time, customer_name, customer_address, next_call_orders_date, ts_inserted, outcome_text FROM 
call_orders JOIN customer ON call_orders.customer_id = customer.id
JOIN employee ON call_orders.employee_id = employee.id
JOIN call_orders_outcome ON call_orders.call_orders_outcome_id = call_orders_outcome.id
WHERE call_orders_outcome.outcome_text LIKE "% successfully"



