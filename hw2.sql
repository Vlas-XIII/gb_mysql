DROP SCHEMA IF EXISTS hw2;
CREATE SCHEMA IF NOT EXISTS hw2;
USE hw2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE NOT NULL,
	count_product INT
);

INSERT INTO sales (id, order_date, count_product)
VALUES
	(1, '2022-01-01', 156),
    (2, '2022-01-02', 180),
    (3, '2022-01-03', 21),
    (4, '2022-01-04', 124),
    (5, '2022-01-05', 341);
    
SELECT * FROM sales;

SELECT
	id AS 'id заказа',
	IF (count_product < 100, 'Маленький заказ',
		IF (count_product > 100 AND count_product < 300, 'Средний заказ', 'Большой заказ'))
AS 'Тип заказа'
FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(5) NOT NULL,
	amount NUMERIC(5, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (id, employee_id, amount, order_status)
VALUES
	(1, 'e03', 15.00, 'OPEN'),
    (2, 'e01', 25.50, 'OPEN'),
    (3, 'e05', 100.70, 'CLOSED'),
    (4, 'e02', 22.18, 'OPEN'),
    (5, 'e04', 9.50, 'CANCELLED');


SELECT employee_id, amount,
CASE
	WHEN order_status = 'OPEN' 
		THEN 'Order is in open state'
	WHEN order_status = 'CANCELLED' 
		THEN 'Order is cancelled'
	ELSE 'Order is closed'
END AS full_order_status
FROM orders;