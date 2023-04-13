# Создание БД
CREATE DATABASE mobile;

# Выбор активной БД
USE mobile;

# Создание таблицы
CREATE TABLE phone
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(40) NOT NULL,
ProductCount INT NOT NULL,
Price NUMERIC
);

# Заполнение таблицы
INSERT phone
(ProductName, Manufacturer, ProductCount, Price)
VALUES
	('iPhone X', 'Apple', '3', '76000'),
	('iPhone 8', 'Apple', '2', '51000'),
	('Galaxy S9', 'Samsung', '2', '56000'),
	('Galaxy S8', 'Samsung', '1', '41000'),
	('P20 Pro', 'Huawei', '5', '36000'),
	('Mi 9', 'Xiaomi', '2', '35000');

# Вывод всей таблицы
SELECT * FROM phone;

# Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price 
FROM phone
WHERE ProductCount > '2';

# Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName, Manufacturer, Price 
FROM phone
WHERE Manufacturer = 'Samsung';

#С помощью регулярных выражений найти товары, в которых есть упоминание "Iphone"
SELECT * 
FROM phone
WHERE ProductName LIKE '%iPhone%';

#С помощью регулярных выражений найти товары, в которых есть упоминание "Samsung"
SELECT * 
FROM phone
WHERE Manufacturer LIKE '%Samsung%';

# товары, в которых есть цифра "8"
SELECT * 
FROM phone
WHERE ProductName LIKE '%8%';