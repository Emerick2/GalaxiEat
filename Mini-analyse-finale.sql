-- Prix moyen des plats par catégorie.
SELECT AVG(d1."Price") AS "Prix", d1."Category"
FROM Dishes d1
GROUP BY d1."Category";

-- Montant total des ventes.
SELECT SUM(Dishes."Price" * OrderItems."Quantity") AS "Montant total des ventes"
FROM OrderItems
JOIN Dishes ON Dishes."IdDishes" = "OrderItems"."IdDishes";

-- Les 3 plats les plus chers.
SELECT *
FROM Dishes
ORDER BY Dishes."Price" DESC
LIMIT 3;

-- Les 3 plats les plus chers.
SELECT *
FROM Employees
WHERE Employees."Lastname" LIKE "%a%";