--  1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными.
CREATE DATABASE IF NOT EXISTS seminar1;

USE seminar1;

DROP TABLE IF EXISTS productRange;

CREATE TABLE productRange
(
Id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(45),
Manufacturer VARCHAR(20),
ProductCount INT(10),
Price INT(15)
);

INSERT productRange (ProductName, Manufacturer, ProductCount, Price)
VALUES
("iPhone X", "Apple", "3", "76000"),
("iPhone 8", "Apple", "2", "51000"),
("Galaxy S9", "Samsung", "2", "56000"),
("Galaxy S8", "Samsung", "1", "41000"),
("P20 Pro", "Huawei", "5", "36000");

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price FROM productRange WHERE ProductCount > "2";

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE Manufacturer = "Samsung";

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE (ProductCount * Price) > "100000" AND (ProductCount * Price) < "145000";

-- 4.1 С помощью регулярных выражений найти (можно использовать операторы "LIKE", "RLIKE" для 4.3 )
-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE ProductName LIKE "iPhone%";

-- 4.2. "Galaxy"
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE ProductName LIKE "Galaxy%";

-- 4.3. Товары, в которых есть ЦИФРЫ
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE ProductName RLIKE "[0-9]";

-- 4.4.  Товары, в которых есть ЦИФРА "8"
SELECT ProductName, Manufacturer, ProductCount, Price FROM productRange WHERE ProductName RLIKE "8";