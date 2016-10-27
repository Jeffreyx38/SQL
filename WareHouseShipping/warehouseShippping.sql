--Jefferson Zhumi
--CIS 205
--Warehouse Shipping
--Partner Alieen 

1.
SELECT o.orderID, s.shipDate
FROM OrderTable o
JOIN Shipment s ON o.orderID = s.orderID
WHERE warehouseID = '115'; 
2.
SELECT s.orderID
FROM Shipment s
JOIN Warehouse w ON s.warehouseID = w.warehouseID
WHERE wcity = 'New York';
3.
SELECT a.cName, COUNT(b.customerID) AS 'Number of Orders', AVG(price) AS 'Average Amount Spent'
FROM Customer a
JOIN OrderTable b ON a.customerID = b.customerID
JOIN Order_Item c ON b.orderID = c.orderID
JOIN Item d ON c.itemID = d.itemID
GROUP BY b.customerID;
4.
SELECT orderID
FROM Shipment
WHERE shipDate BETWEEN '2003-01-01' AND '2003-12-01';
5.
SELECT a.customerID, a.cName, b.orderID, SUM(price), shipDate
FROM Customer a
JOIN OrderTable b ON a.customerID = b.customerID
JOIN Order_Item c ON b.orderID = c.orderID
JOIN Item d ON c.itemID = d.itemID
JOIN Shipment e ON b.orderID = e.orderID
WHERE shipDate IS NULL
GROUP BY b.orderID;
6.
UPDATE Shipment SET shipDate = '2016-04-11'
WHERE orderID = '10007';
7.
SELECT cName
FROM Customer
ORDER BY cName DESC;