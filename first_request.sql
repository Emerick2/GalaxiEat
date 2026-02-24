-- Lister tous les restaurants de la galaxie.
SELECT Name 
FROM Restaurants;

-- Lister tous les plats classés par prix décroissant.
SELECT Name, Price
FROM Dishes
ORDER BY Price DESC;

-- Lister tous les employés triés par rôle.
SELECT FirstName, LastName, Role
FROM Employees
ORDER BY Role;

-- Lister tous les plats végétariens
SELECT Name
FROM Dishes
WHERE is_vegan = "True";

-- Lister les plats dont le prix est supérieur à la moyenne des prix.
SELECT Name, Price
FROM Dishes
WHERE Price > (SELECT AVG(Price) FROM Dishes);