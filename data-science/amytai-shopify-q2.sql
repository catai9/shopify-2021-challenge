-- Part A: How many orders were shipped by Speedy Express in total?
SELECT COUNT(*) as tot_orders
FROM Orders
INNER JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
WHERE Shippers.ShipperName="Speedy Express";

-- Part B: What is the last name of the employee with the most orders?
-- WITH ASSUMPTION
SELECT E0.LastName 
FROM Employees as E0
WHERE E0.EmployeeID = (
    SELECT O1.EmployeeID
    FROM Employees as E1
    INNER JOIN Orders as O1 ON O1.EmployeeID=E1.EmployeeID
    GROUP BY O1.EmployeeID
    ORDER BY COUNT(O1.OrderID) DESC 
    LIMIT 1
);

-- NO ASSUMPTION
SELECT E0.LastName 
FROM Employees as E0
WHERE E0.EmployeeID = (
    SELECT O1.EmployeeID
    FROM Employees as E1
    INNER JOIN Orders as O1 ON O1.EmployeeID=E1.EmployeeID
    GROUP BY O1.EmployeeID
    HAVING COUNT(O1.OrderID) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(O2.OrderID) as cnt 
            FROM Orders as O2
            GROUP BY O2.EmployeeID
        )
    )
);

-- Part C: What product was ordered the most by customers in Germany?
-- WITH ASSUMPTION
SELECT ProductID, COUNT(ProductID)
FROM OrderDetails 
INNER JOIN Orders ON Orders.OrderID=OrderDetails.OrderID
WHERE Orders.CustomerID IN (
    SELECT CustomerID 
    FROM Customers
    WHERE Customers.Country = "Germany"
)
GROUP BY ProductID
ORDER BY COUNT(ProductID) DESC
LIMIT 1;

-- NO ASSUMPTION
SELECT D1.ProductID, COUNT(D1.ProductID)
FROM OrderDetails as D1
INNER JOIN Orders as O1 ON O1.OrderID=D1.OrderID
WHERE O1.CustomerID IN (
    SELECT C1.CustomerID 
    FROM Customers as C1
    WHERE C1.Country = "Germany"
)
GROUP BY D1.ProductID
HAVING COUNT(D1.ProductID) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(D2.ProductID) as cnt 
        FROM OrderDetails as D2
        INNER JOIN Orders as O2 ON O2.OrderID=D2.OrderID
        WHERE O2.CustomerID IN (
            SELECT C2.CustomerID 
            FROM Customers as C2
            WHERE C2.Country = "Germany"
        )
        GROUP BY D2.ProductID
    )
);