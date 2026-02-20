-- Insérer 3 commandes dans différents restaurants.
INSERT INTO OrderItems ("IdOrders", "IdDishes", "Quantity")
VALUES (1,2,1);

INSERT INTO OrderItems ("IdOrders", "IdDishes", "Quantity")
VALUES (2,3,5);

INSERT INTO OrderItems ("IdOrders", "IdDishes", "Quantity")
VALUES (1,1,2);


-- Calculer pour chaque commande : (Nombre total d’articles / montant total) 
SELECT
(
SELECT COUNT(commande1."IdOrders" = commande2."IdOrders")
FROM OrderItems commande2
) AS "Nombre total d’articles",
(
SELECT SUM(Dishes."Price")
FROM OrderItems commande2
JOIN Dishes ON Dishes."IdDishes" = commande2."IdDishes"
WHERE commande1."IdOrders" = commande2."IdOrders"
) AS "Montant total"
FROM OrderItems commande1;
-- Calculer pour chaque commande : (Nombre total d’articles / montant total) 
SELECT
(
SELECT COUNT(commande1."IdOrders" = commande2."IdOrders")
FROM OrderItems commande2
) AS "Nombre total d’articles",
(
SELECT SUM(Dishes."Price")
FROM OrderItems commande2
JOIN Dishes ON Dishes."IdDishes" = commande2."IdDishes"
WHERE commande1."IdOrders" = commande2."IdOrders"
) AS "Montant total"
FROM OrderItems commande1
ORDER BY "Montant total" ASC;