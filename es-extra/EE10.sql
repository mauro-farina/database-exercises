-- Sul DB classicmodels, elencare i clienti (customerName) che in almeno un anno 
-- hanno acquistato l'articolo più venduto in quell'anno. 
-- Suggerimento: definire la UDF most_sold_of_year

DELIMITER $$
CREATE FUNCTION most_sold_of_year(orderYear INT)
RETURNS varchar(15)
DETERMINISTIC
BEGIN
	DECLARE result varchar(15);
	SELECT productCode INTO result
    FROM orderdetails od
    INNER JOIN orders o ON o.orderNumber = od.orderNumber
		AND year(o.orderDate) = orderYear
	GROUP BY od.productCode
    ORDER BY sum(quantityOrdered) LIMIT 1;
    RETURN result;
END $$
DELIMITER ;


SELECT DISTINCT customerName 
FROM customers
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
WHERE productCode = most_sold_of_year(year(orderDate));