-- Sul DB classicmodels, quanti ordini ha effettuato ciascun cliente (customer) in ogni anno (orderDate)? E quanto ha speso? 
-- Ordinare i risultati in ordine alfabetico rispetto al nome del cliente (customerName)

SELECT c.customerName, year(o.orderDate) AS orderYear, 
	count(*) AS numOrders, sum(od.quantityOrdered * priceEach) AS total
FROM customers c
INNER JOIN orders o USING(customerNumber)
INNER JOIN orderdetails od USING(orderNumber)
INNER JOIN products p USING(productCode)
GROUP BY c.customerNumber, orderYear
ORDER BY c.customerName;