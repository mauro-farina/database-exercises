-- Sul DB classicmodels, elencare i prodotti che 
-- (i) appartengano a una productLine contenente più di 20 prodotti e 
-- (ii) abbiano un buyPrice maggiore del buyPrice medio della productLine a cui appartiene

SELECT p1.productLine, p1.productName, p1.buyPrice
FROM products p1
WHERE productLine IN (
	SELECT productLine
	FROM products
	GROUP BY productLine
	HAVING count(*) > 20
) AND buyPrice > (
	SELECT avg(p2.buyPrice)
    FROM products p2
    WHERE p2.productLine = p1.productLine
);