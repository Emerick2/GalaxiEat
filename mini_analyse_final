-- Prix moyen des plats par catégorie.
SELECT Category, AVG(Price) AS AveragePrice
FROM Dishes
GROUP BY Category;

-- Montant total des ventes.
SELECT SUM(Total_amount) AS TotalSales
FROM CustomerOrders;
-- Les 3 plats les plus chers.
SELECT Name, Price
FROM Dishes
ORDER BY Price DESC
LIMIT 3;

-- Les employés dont le nom contient la lettre “a”
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '%a%' OR LastName LIKE '%a%';