USE shopfront;
/*
>Identify the columns require indexing in order, product, category tables and create indexes
*/
SELECT * FROM product;


ALTER TABLE product ADD INDEX product_name_index(product_name);

SHOW INDEX FROM product;


SELECT * FROM orders;

ALTER TABLE orders ADD INDEX order_status_index(order_status);

SHOW INDEX FROM orders;

SELECT * FROM subcategory;

ALTER TABLE subcategory ADD INDEX subcat_name_index(subcategory_name);

SHOW INDEX FROM subcategory;