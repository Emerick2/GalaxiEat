-- Supprimer tous les plats à prix NULL (si existant)
DELETE FROM Dishes
WHERE Dishes."Price" IS NULL;

-- Supprimer tous les plats à prix NULL (si existant)
DELETE FROM OrderItems
WHERE (
SELECT SUM(Dishes."Price")
FROM OrderItems commande2
JOIN Dishes ON Dishes."IdDishes" = commande2."IdDishes"
WHERE OrderItems."IdOrders" = commande2."IdOrders"
) < 5;