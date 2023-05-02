DROP SCHEMA IF EXISTS hw6;
CREATE SCHEMA IF NOT EXISTS hw6;
USE hw6;

# Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
# Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS secdays;
delimiter //

CREATE FUNCTION secdays(sec INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE min INT;
    DECLARE hours INT;
    DECLARE days INT;
    DECLARE result VARCHAR(45);
    
    SET days = FLOOR(sec / 86400);
    SET sec = sec MOD 86400;
    SET hours = FLOOR(sec / 3600);
    SET sec = sec MOD 3600;
    SET min = FLOOR(sec / 60);
    SET sec = sec MOD 60;
    
	SET result = CONCAT(days, ' days ', hours, ' hours ', min, ' minutes ', sec, ' seconds');
	RETURN result;
END //
delimiter ;

SELECT secdays(123456) AS 'time_interval';


# Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS numbers;
delimiter //
CREATE PROCEDURE numbers()
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR (45) DEFAULT '';
	WHILE i <= 10 DO
		IF i % 2 = 0 THEN
        	SET result = CONCAT(result, ' ', i);
		END IF;
		SET i = i + 1;
	END WHILE;
    SELECT result;
END //
delimiter ;

CALL numbers();