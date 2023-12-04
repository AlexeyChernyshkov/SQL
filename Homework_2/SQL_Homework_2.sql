--Таблицы Предметы и Учителя
CREATE TABLE teachers(
	teachers_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	teachers_name VARCHAR(50)
);

INSERT INTO teachers(teachers_name) 
VALUES ("Анастасия"),
("Денис");

CREATE TABLE courses(
	course_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	course_name VARCHAR(50),
  	course_type VARCHAR(50),
	teachers_id INT,
  	FOREIGN KEY (teachers_id) REFERENCES teachers(teachers_id)
);

INSERT INTO courses(course_name, course_type, teachers_id) 
VALUES ("Программирование", "Разработка", 1),
("Тестирование", "Контроль качества", 1),
("Дизайн", "Веб-дизайн", 2);

SELECT * FROM courses;
SELECT * FROM courses WHERE course_name = "Тестирование";
SELECT * FROM courses WHERE course_type = "Веб-дизайн"

--Таблицы Поставщики и Товары

CREATE TABLE vendors(
	vendor_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	vendor_name VARCHAR(50)
);

CREATE TABLE goods(
	goods_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	goods_name VARCHAR(50),
  	goods_type VARCHAR(50),
	vendor_id INT,
  	FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);

INSERT INTO vendors(vendor_name) 
VALUES ("Барнаульский пивоваренный завод (БПЗ)"),
("Барнаульский мясоперерабатывающий завод (БМПЗ)"),
("Барнаульский молочный комбинат (Молочная сказка)");

INSERT INTO goods(goods_name, goods_type, vendor_id) 
VALUES ("Сосиски", "Колбасы", 2),
("Творог", "Молочначя продукция", 3),
("Кефир", "Молочначя продукция", 3),
("Лимонад", "Лимонады", 1);

SELECT * FROM goods;
SELECT * FROM goods WHERE goods_type = "Молочначя продукция";
SELECT vendor_name as "Поставщик", goods_name as "Продукция", goods_type as "Тип продукции" FROM 
	vendors INNER JOIN goods 
	ON vendors.vendor_id = goods.vendor_id
WHERE vendor_name = "Барнаульский молочный комбинат (Молочная сказка)"

--Таблицы Фильмы и Зал

CREATE TABLE halls(
	hall_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	hall_number INT,
	hall_name VARCHAR(50)
	
);

CREATE TABLE films(
	film_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	film_name VARCHAR(50),
  	film_genre VARCHAR(50),
	hall_id INT,
  	FOREIGN KEY (hall_id) REFERENCES halls(hall_id)
);

INSERT INTO halls(hall_number, hall_name) 
VALUES (1, "Большой"),
(2, "Средний"),
(3, "Малый");

INSERT INTO films(film_name, film_genre, hall_id) 
VALUES ("Терминатор", "Боевик", 1),
("Пираты Карибского моря", "Приключения", 2),
("Джон Уик", "Боевик", 1),
("Король вечеринок", "Комедия", 3);

SELECT * FROM films;
SELECT film_name as "Название", film_genre as "Жанр", hall_number as "Номер зала", hall_name as "Зал" FROM 
	halls INNER JOIN films
	ON halls.hall_id = films.hall_id
WHERE hall_name = "Большой";
SELECT * FROM films WHERE film_genre = "Приключения"

--Таблицы Огород и Продукт

CREATE TABLE garden(
	seedbed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	seedbed_name VARCHAR(50),
	seedbed_size VARCHAR(50)
);

CREATE TABLE products(
	product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_count INT,
	product_name VARCHAR(50),
	seedbed_id INT,
  	FOREIGN KEY (seedbed_id) REFERENCES garden(seedbed_id)
);

INSERT INTO garden(seedbed_name, seedbed_size) 
VALUES ("Овощная", "Большая"),
("Ягодная", "Средняя"),
("Фруктовая", "Малая");

INSERT INTO products(product_count, product_name, seedbed_id) 
VALUES (20, "Помидоры", 2),
(15, "Огурцы", 1),
(10, "Арбуз", 2),
(7, "Груша", 3),
(8, "Кукуруза", 1);


SELECT * FROM products;

SELECT * FROM garden WHERE seedbed_name = "Фруктовая";

SELECT product_count as "Количество", product_name as "Название", seedbed_name as "Грядка", seedbed_size as "Размер грядки" FROM 
	garden INNER JOIN products
	ON garden.seedbed_id = products.seedbed_id
WHERE seedbed_name = "Овощная"














