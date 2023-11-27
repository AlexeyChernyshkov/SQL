--Таблица групп

CREATE TABLE groups_table(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	group_name VARCHAR(50),
	rating INT,
  	course INT 
);

INSERT INTO groups_table(group_name, rating, course) 
VALUES ("Группа 1", 111, 1),
("Группа 2", 222, 2),
("Группа 3", 333, 3);

SELECT * FROM groups_table

--Таблица оружия

CREATE TABLE weapons(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	model VARCHAR(50),
	model_type VARCHAR(50),
  	model_power INT 
);

INSERT INTO weapons(model, model_type, model_power) 
VALUES ("ПМ", "Пистолет", 10),
("UMP", "Пистолет-пулемет", 20),
("АК-47", "Автомат", 30);

SELECT * FROM weapons

--Таблица игр

CREATE TABLE games(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	game_name VARCHAR(50),
	game_date DATE,
  	save_time TIME
);

INSERT INTO games(game_name, game_date, save_time) 
VALUES ("Игра 1", "2023-11-23", "15:45:00"),
("Игра 2", "2023-11-24", "15:45:00"),
("Игра 3", "2023-11-25", "15:45:00");

SELECT * FROM games

--Таблица врачей

CREATE TABLE doctors(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	post VARCHAR(50),
  	salary INTEGER
);

INSERT INTO doctors(name, post, salary) 
VALUES ("Иван", "Глав. врач", 100000),
("Виктор", "Зав. больницей", 50000),
("Николай", "Хирург", 70000);

SELECT * FROM doctors

--Таблица занятий

CREATE TABLE lessons(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	lesson_type VARCHAR(50),
	lesson_date DATE,
  	price INTEGER
);

INSERT INTO lessons(lesson_type, lesson_date, price) 
VALUES ("Программирование", "2023-11-23", 100000),
("Тестирование", "2023-11-23", 50000),
("Дизайн", "2023-11-23", 70000);

SELECT * FROM lessons