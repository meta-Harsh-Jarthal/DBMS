USE shopfront;
/*
>Create a function to calculate number of orders in a month. 
Month and year will be input parameter to function.
>Create a function to return month in a year having maximum orders. Year will be input parameter.
*/
SELECT * FROM orders;

DELIMITER $$
CREATE FUNCTION number_of_orders(month INT,year INT)
RETURNS INT
NOT DETERMINISTIC
BEGIN
     DECLARE total_orders INT;
     SET total_orders = (SELECT COUNT(DISTINCT order_id) 
     FROM orders 
     WHERE MONTH(order_date) = month AND YEAR(order_date) = year);
     RETURN total_orders;
END $$
DELIMITER ;

SELECT number_of_orders(11,2022);
SELECT number_of_orders(12,2021);
SELECT number_of_orders(1,2022);
SELECT number_of_orders(2,2022);



DELIMITER $$
CREATE FUNCTION month_of_max_orders(year INT)
RETURNS INT
NOT DETERMINISTIC
BEGIN
     DECLARE month INT;
     SET month = (SELECT MONTH(order_date)
     FROM orders
     WHERE YEAR(order_date) = year
     GROUP BY MONTH(order_date)
     ORDER BY COUNT(DISTINCT order_id) DESC
     LIMIT 1);
     RETURN month;
END $$
DELIMITER ;

SELECT month_of_max_orders(2021);
SELECT month_of_max_orders(2022);
