USE shopfront;
/*
>Create a Stored procedure to retrieve average sales of each product in a month.
Month and year will be input parameter to function.

>Create a stored procedure to retrieve table having order detail with status for a given period.
Start date and end date will be input parameter.
Put validation on input dates like start date is less than end date.
If start date is greater than end date take first date of month as start date.
*/

SELECT * FROM product_detailed_order;


DELIMITER $$
CREATE PROCEDURE retrieve_avg_month_sales(IN month INT,IN year INT)
BEGIN
      SELECT product_id as 'Product Id',AVG(product_quantity) as 'Average Sales'
      FROM product_detailed_order
      WHERE MONTH(order_date) = month AND YEAR(order_date) = year
      GROUP BY product_id;
END$$
DELIMITER ;
    
select * from orders;     
CALL retrieve_avg_month_sales(1,2022); 

DELIMITER $$
CREATE PROCEDURE order_details_for_period(IN start_date DATE,IN end_date DATE)
BEGIN
      DECLARE difference INT;
      DECLARE first_day_of_month DATE;
      IF start_date <= end_date THEN
         SELECT order_id as Id, order_status as Status,order_date as OrderDate
         FROM orders
         WHERE order_date >= start_date AND order_date <=end_date;
      ELSE
         SET difference = DAY(start_date)-1;
         SET first_day_of_month = DATE_SUB(start_date,INTERVAL difference DAY);
         
         SELECT order_id as Id, order_status as Status,order_date as OrderDate
         FROM orders
         WHERE order_date >= first_day_of_month AND order_date <=end_date;
    END IF;
      
END$$
DELIMITER ;

CALL order_details_for_period('2022-01-15','2022-01-14');