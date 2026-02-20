-- Lister tous les restaurants de la galaxie. 
SELECT *
FROM Restaurants;

-- Lister tous les plats classés par prix décroissant. 
SELECT *
FROM Dishes
ORDER BY Dishes."Price" DESC;

-- Lister tous les employés triés par rôle. 
SELECT *
FROM Employees
ORDER BY Employees."Role" ASC;

-- Lister tous les plats végétariens
SELECT *
FROM Dishes
WHERE Dishes.is_vegan = 'True';

-- Lister les plats dont le prix est supérieur à la moyenne des prix.
SELECT *
FROM Dishes d1
WHERE d1."Price" > (
SELECT AVG(d2."Price")
FROM Dishes d2
);

