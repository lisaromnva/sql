-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP DATABASE IF EXISTS hw_db;
CREATE DATABASE hw_db;
USE hw_db;
DROP FUNCTION IF EXISTS convert_seconds;
DELIMITER $$
CREATE FUNCTION convert_seconds ( seconds INT )
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN

DECLARE SS INT;
DECLARE MM INT;
DECLARE HH INT;
DECLARE DD INT;
DECLARE res VARCHAR(100);
set SS = round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60);
set DD = floor(seconds/60/60/24);
set HH = floor(mod(seconds/60/60/24,1) * 24);
set MM = floor(mod(mod(seconds/60/60/24,1)*24,1)*60);
set res = CONCAT(DD, ' days ', HH, ' hours ', MM, ' minuts ', SS, ' seconds');
RETURN res;
END;

SELECT convert_seconds(12356);

-- Выведите только четные числа от 1 до 10 (Через цикл внутри процедуры). Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER //
CREATE PROCEDURE print_numbers
(
	IN input_numbers INT
)
BEGIN
	DECLARE n INT;
	DECLARE result VARCHAR(45) DEFAULT "";
	SET n = input_numbers;

	REPEAT
	SET n = n + 1;
    IF n % 2 = 0 THEN
		SET result = CONCAT(result, n, ",");
	END IF;
	UNTIL n >= 10
	END REPEAT;
	SELECT result;
END //

CALL print_numbers(1);