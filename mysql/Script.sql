DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE IF NOT EXISTS human_friends;
USE human_friends;

CREATE TABLE IF NOT EXISTS type_of_animals(
        id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
        name VARCHAR(50)
); 

-- Добавим категории 

INSERT INTO type_of_animals(name)
VALUES
	('Домашние животные'),
	('Вьючные животные');
SELECT * FROM type_of_animals;

-- Создадим таблицу с типами животных

DROP TABLE IF EXISTS types;
CREATE TABLE IF NOT EXISTS types(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	type_of_animals_id INT,
	CONSTRAINT fk_type_of_animals FOREIGN KEY(type_of_animals_id) REFERENCES type_of_animals(id)
); 

-- Заполним таблицу видами животных 

INSERT INTO types(name, type_of_animals_id)
VALUES
	('Собака', 1),
	('Кошка', 1),
	('Хомяк', 1),
	('Лошадь', 2),
	('Осёл', 2),
	('Верблюд', 2);

SELECT * FROM types;

-- Создадим таблицу с именами, типами и датами рождения

DROP TABLE IF EXISTS animals;
CREATE TABLE IF NOT EXISTS animals(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	name VARCHAR(50),
	type_id int,
	birthday DATE,
	CONSTRAINT fk_type Foreign Key (type_id) REFERENCES types(id)
);

-- Заполним таблицу данными о животных 

INSERT INTO animals(name, type_id, birthday)
values
	('Гриша', 1, '2018-05-20'),
	('Ксюша', 1, '2019-09-22'),
	('Лапа', 1, '2020-05-18'),
	('Римма', 1, '2016-12-11'),
	('Линда', 2, '2020-10-22'),
	('Барт' , 2, '2022-09-01'),
	('Хома', 3, '2019-11-11'),
	('Вася', 3, '2021-06-24'),
	('Буран', 4, '2019-07-04'),
	('Жак', 4, '2018-11-23'),
	('Нарцисс', 4, '2023-09-18'),
	('Мирон', 5, '2024-05-15'),
	('Дуня', 5, '2018-12-12'),
	('Липа', 2, '2019-01-23'),
	('Мак', 6, '2021-09-29'),
	('Шегер', 6, '2019-08-24'),
	('Миша', 1, '2023-11-11'),
	('Лаванда', 3, '2023-03-23');

SELECT * FROM animals;

-- Создадим таблицу для команд 

DROP TABLE IF EXISTS commands;
CREATE TABLE IF NOT EXISTS commands(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	animal_id int,
	CONSTRAINT fk_animal Foreign Key (animal_id) REFERENCES animals(id)
);

-- Присвоим команды животным

INSERT INTO commands(name, animal_id)
values
	('Место', 1), ('Лежать', 1), ('Сидеть', 1),
	('Сидеть', 2), ('Танцуй', 2), ('Голос', 2),
	('Место', 3), ('Фас', 3),
	('Лапу', 4), ('Волчок', 4),
	('Мурлыкать', 5), ('Спать', 5),
	('На шкаф', 6), ('Петь', 6),
	('Колесо', 7), ('Есть', 7), ('Хрустеть', 7),
	('Бегать', 8), ('Прыгать', 8),
	('Галлоп', 9), ('Барьер', 9), ('Прыгать', 9),
	('Аллюр', 10), ('Спать', 10),
	('Прогулка', 11), ('Стоянка', 11),
	('Стоять', 12), ('Вперёд', 12),
	('Жевать', 13), ('Грустить', 13),
	('Убрать когти', 14), ('Ласка', 14),
	('Жевать', 15), ('Прятаться', 15),
	('Гулять', 16), ('Копыто', 16),
	('Гулять', 17), ('Голос', 17),
	('Спинка', 18), ('Шелестеть', 18);

SELECT * FROM commands;

-- Удаление записей о верблюдах

-- DELETE FROM animals WHERE type_id = 6;

/*
DELETE FROM commands WHERE animal_id = 15;
DELETE FROM commands WHERE animal_id = 16;

UPDATE commands SET animal_id = NULL WHERE animal_id = 15;
UPDATE commands SET animal_id = NULL WHERE animal_id = 16;
DELETE FROM animals WHERE type_id = 6;
UPDATE animals SET type_id = NULL WHERE type_id = 6;

SELECT * FROM commands;
SELECT * FROM animals;

*/

-- Создадим виртуальную таблицу - представление для выбора только лошадей и ослов

CREATE VIEW pack_animals_without_camel AS
SELECT
    a.id,
    a.name,
    a.birthday,
    t.name AS animal_type,
    c.name AS type_of_animals,
    GROUP_CONCAT(cm.name ORDER BY cm.name ASC SEPARATOR ', ') AS concatenated_commands
FROM animals AS a
LEFT JOIN types AS t ON t.id = a.type_id
JOIN type_of_animals AS c ON t.type_of_animals_id = c.id
LEFT JOIN commands AS cm ON cm.animal_id = a.id
WHERE c.name = 'Вьючные животные' AND (t.name = 'Лошадь' OR t.name = 'Осёл')
GROUP BY a.id, a.name, a.birthday, t.name, c.name;

SELECT * from pack_animals_without_camel;

CREATE VIEW animals_age_from_1_to_3 AS
SELECT
    a.name,
    a.birthday,
    t.name AS animal_type,
    c.name AS type_of_animals,
    CONCAT(
        TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()),
        ' years ',
        TIMESTAMPDIFF(MONTH, a.birthday, CURDATE()) % 12,
        ' months '
    ) AS age
FROM animals AS a
LEFT JOIN types AS t ON t.id = a.type_id
JOIN type_of_animals AS c ON t.type_of_animals_id = c.id
WHERE TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()) BETWEEN 1 AND 3;

SELECT * FROM animals_age_from_1_to_3;

-- Выведем объединеннную таблицу 

SELECT
	a.id,
	a.name,
    CONCAT(
        TIMESTAMPDIFF(YEAR, a.birthday, CURDATE()),
        ' years ',
        TIMESTAMPDIFF(MONTH, a.birthday, CURDATE()) % 12,
        ' months '
    ) AS age
FROM animals AS a
LEFT JOIN types AS t ON t.id = a.type_id
JOIN type_of_animals AS c ON t.type_of_animals_id = c.id

