-- CREATE DATABASE car_repair;

USE car_repair;
CREATE TABLE IF NOT EXISTS cars(
	car_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    car_brand VARCHAR(50) NOT NULL,
    car_mark VARCHAR(50) NOT NULL,
    release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS records(
	record_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    record_date DATE NOT NULL,
    record_time TIME NOT NULL,
    car_id INT NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);

INSERT INTO cars(car_brand, car_mark, release_year)
VALUES ("Lada", "Vesta", "2019-05-02"),
("BMW", "X5", "2019-02-05"),
("Reno", "Logan", "2006-05-03"),
("Toyota", "Land Criuser", "2008-06-24"),
("Toyota", "Corolla", "1999-10-05"),
("Lada", "Granta", "2011-06-22"),
("BMW", "X3", "2014-04-28"),
("Reno", "Arcana", "2015-06-30"),
("Chevrolet", "Aveo", "2016-10-07"),
("Lada", "Vesta SW Cross", "2018-02-22"),
("Geely", "Coolray", "2018-07-25");

INSERT INTO records(record_date, record_time, car_id)
VALUES ("2023-12-01", "08:00:00", 1),
("2023-11-05", "08:30:00", 2),
("2023-11-06", "09:00:00", 3),
("2023-12-08", "09:30:00", 4),
("2023-11-12", "10:00:00", 5),
("2023-12-13", "10:30:00", 6),
("2023-11-20", "11:00:00", 7),
("2023-12-26", "11:30:00", 8),
("2023-12-27", "13:00:00", 9),
("2023-11-28", "13:30:00", 10),
("2023-12-29", "14:00:00", 11);


-- 1.1. показать всех записи и их авто
SELECT record_date AS "Дата записи", record_time AS "Время записи", car_brand AS "Марка", car_mark AS "Модель", release_year AS "Год выпуска" FROM records, cars
WHERE cars.car_id = records.car_id
ORDER BY record_date;

-- 1.2. Показать всех авто с маркой “lada” и в какие даты они записаны
SELECT record_date AS "Дата записи", record_time AS "Время записи", car_brand AS "Марка", car_mark AS "Модель" FROM records, cars
WHERE cars.car_id = records.car_id AND car_brand = "Lada"
ORDER BY record_date;

-- 1.3. Показать всех авто года выпуска 2017 и старше и их записи
SELECT record_date AS "Дата записи", record_time AS "Время записи", car_brand AS "Марка", car_mark AS "Модель", release_year AS "Год выпуска" FROM records, cars
WHERE cars.car_id = records.car_id AND release_year > "2017-01-01"
ORDER BY record_date;

-- 1.4. Показать всех записи за текущий месяц и их авто
SELECT record_date AS "Дата записи", record_time AS "Время записи", car_brand AS "Марка", car_mark AS "Модель", release_year AS "Год выпуска" FROM records, cars
WHERE cars.car_id = records.car_id AND record_date > "2023-12-01" AND record_date < "2023-12-31"
ORDER BY record_date;

-- DROP TABLE cars;
-- DROP TABLE records





