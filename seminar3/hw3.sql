DROP DATABASE IF EXISTS lesson_3;
CREATE DATABASE lesson_3;

USE lesson_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
 ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
-- 1 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 

SELECT * 
FROM staff 
ORDER BY salary DESC;

SELECT *
FROM staff
ORDER BY salary;

-- 2 Выведите 5 максимальных заработных плат (saraly)

SELECT
    firstname,
    lastname,
    salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3 Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT
    DISTINCT post,
    SUM(salary) AS TotalSum
FROM staff
GROUP BY post;

-- 3 Посчитайте суммарную зарплату (salary) по каждой специальности (роst) ТОП-2 в каждой категории
SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

SELECT id, post, salary,
	(SELECT SUM(salary) FROM staff WHERE post = "Начальник" GROUP BY post ) AS "Суммарная зарплата 'Начальник'",
    (SELECT SUM(salary) FROM staff WHERE post = "Инженер" GROUP BY post ) AS "Суммарная зарплата 'Инженер'",
    (SELECT SUM(salary) FROM staff WHERE post = "Рабочий" GROUP BY post ) AS "Суммарная зарплата 'Рабочий'",
    (SELECT SUM(salary) FROM staff WHERE post = "Уборщик" GROUP BY post ) AS "Суммарная зарплата 'Уборщик'"
FROM staff s
WHERE id IN
	( SELECT * FROM ( SELECT st.id
    FROM staff as st
    WHERE st.post = s.post
    ORDER BY st.salary DESC
    LIMIT 2
    ) AS sub);

-- 4 Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
    post,
    COUNT(*)
FROM staff
WHERE post IN ('Рабочий') AND (age BETWEEN 24 AND 49)
GROUP BY post;


-- 5 Найдите количество специальностей
SELECT 
    COUNT ( DISTINCT post) AS count_post
FROM staff;

-- 6 Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT 
	post,
    AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;