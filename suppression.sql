-- Supprimer tous les plats à prix NULL (si existant)
DELETE FROM Dishes WHERE Price IS NULL;

-- Supprimer les commandes de test dont le total est inférieur à 5.
DELETE FROM CustomerOrders WHERE Total_amount < 5;