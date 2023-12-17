CREATE DATABASE IF NOT EXISTS best_aero;
use best_aero;
create table if not exists passengers (
	id INT PRIMARY KEY auto_increment,
    name_passenger VARCHAR(30) );
    

create table if not exists companies(
	company_name varchar (255),
    id int primary key AUTO_INCREMENT
);
create table if not exists trips(
    plane varchar(255),
    town_from varchar (255),
    town_to varchar (255),
    time_out datetime,
    time_in datetime,
    id int primary key AUTO_INCREMENT,
    company int,
    foreign key (company) REFERENCES companies(id)
    );
create table if not exists Pass_in_trip(
	id INT PRIMARY KEY auto_increment,
	trip INT,
     FOREIGN KEY (trip) REFERENCES trips (id),
    passenger INT,
     FOREIGN KEY (passenger) REFERENCES passengers (id),
     place VARCHAR(3));



-- Добавление записей в таблицу "passengers"
INSERT INTO passengers (name_passenger) VALUES
    ('John Smith'),
    ('Emma Johnson'),
    ('Michael Brown'),
    ('Sophia Williams'),
    ('William Davis'),
    ('Olivia Miller'),
    ('James Wilson'),
    ('Ava Martinez'),
    ('Robert Anderson'),
    ('Mia Garcia'), 
    ('Sophie Brown'),
    ('Liam Johnson'),
    ('Charlotte Davis'),
    ('Noah Martinez'),
    ('Ava Smith'),
    ('Ethan Wilson'),
    ('Isabella Thompson'),
    ('Mason Garcia'),
    ('Olivia Clark'),
    ('William Rodriguez');

-- Добавление записей в таблицу "companies"
INSERT INTO companies (company_name) VALUES
    ('Delta Airlines'),
    ('United Airlines'),
    ('American Airlines'),
    ('Lufthansa'),
    ('Emirates'),
    ('British Airways'),
    ('Air France'),
    ('Qatar Airways'),
    ('Singapore Airlines'),
    ('Cathay Pacific');

-- Добавление записей в таблицу "trips"
INSERT INTO trips (plane, town_from, town_to, time_out, time_in, company) VALUES
    ('Boeing 737', 'New York', 'Los Angeles', '2023-01-01 08:00:00', '2023-01-01 11:00:00', 1),
    ('Airbus A320', 'London', 'Paris', '2023-01-02 09:00:00', '2023-01-02 10:30:00', 2),
    ('Boeing 777', 'Tokyo', 'Sydney', '2023-01-03 10:00:00', '2023-01-03 22:00:00', 3),
    ('Airbus A350', 'Dubai', 'Singapore', '2023-01-04 11:00:00', '2023-01-04 15:00:00', 2),
    ('Boeing 787', 'Berlin', 'Moscow', '2023-01-05 12:00:00', '2023-01-05 14:30:00', 5),
    ('Airbus A380', 'Rome', 'Tokyo', '2023-01-06 13:00:00', '2023-01-06 20:00:00', 3),
    ('Boeing 747', 'Paris', 'Dubai', '2023-01-07 14:00:00', '2023-01-07 18:00:00', 1),
    ('Airbus A330', 'Singapore', 'Hong Kong', '2023-01-08 15:00:00', '2023-01-08 16:30:00', 2),
    ('Boeing 767', 'New Delhi', 'Sydney', '2023-01-09 16:00:00', '2023-01-09 23:00:00', 9),
    ('Airbus A310', 'Hong Kong', 'Tokyo', '2023-01-10 17:00:00', '2023-01-10 19:30:00', 10);



-- Добавление записей в таблицу "Pass_in_trip"
INSERT INTO Pass_in_trip (trip, passenger, place) VALUES
    (1, 1, 'A1'),
    (2, 2, 'B3'),
    (3, 3, 'C2'),
    (4, 4, 'D4'),
    (4, 15, 'F4'),
      (4, 16, 'E4'),
      (4, 17, 'A5'),
      (4, 18, 'B5'),
    (5, 5, 'E6'),
    (6, 6, 'F5'),
    (7, 7, 'G8'),
    (8, 8, 'H10'),
    (8, 11, 'B10'),
    (8, 12, 'A11'),
    (8, 13, 'C10'),
    (8, 14, 'D10'),
    (9, 9, 'I7'),
    (10, 10, 'J9');
    
    
-- Выбрать пассажиров и их места в рейсе:

SELECT name_passenger, place FROM
Pass_in_trip JOIN passengers ON Pass_in_trip.passenger = passengers.id;

-- Подсчитать общее количество пассажиров на конкретном рейсе:

SELECT plane, COUNT(passenger) FROM 
Pass_in_trip JOIN trips ON Pass_in_trip.trip = trips.id
GROUP BY plane;

-- посчитать рейсы, отправляющиеся после 2023-01-05:

SELECT COUNT(*) FROM trips
WHERE time_out > '2023-01-05 00:00:00';

-- Посчитать количество рейсов, отправленных из каждого города:

SELECT town_from, COUNT(*) FROM trips
GROUP BY town_from;

-- Выбрать среднюю продолжительность рейсов для каждой компании:
-- Для этого запроса подправил таблицу trips, а именно увеличил количество рейсов для компаний

SELECT company_name, SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(TIME(time_in), TIME(time_out))))) AS 'Ср. длительность рейса' FROM 
trips JOIN companies ON trips.company = companies.id
GROUP BY company_name;


-- Выбрать компании и количество рейсов, осуществленных каждой из них:

SELECT company_name, COUNT(company) FROM
trips JOIN companies ON trips.company = companies.id
GROUP BY company_name;

-- Выбрать пассажиров, у которых имя начинается на 'J' и место в рейсе начинается на 'B':

SELECT name_passenger, place FROM
Pass_in_trip JOIN passengers ON Pass_in_trip.passenger = passengers.id
WHERE name_passenger LIKE 'J%' AND place LIKE 'B%'

-- DROP DATABASE best_aero
