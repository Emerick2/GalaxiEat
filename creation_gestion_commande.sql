-- 3 commandes dans différents restaurants.
INSERT INTO CustomerOrders (IdOrders, IdRestaurant, Total_amount, CustomerName)
VALUES (1, 1, 25.50, 'Alice'),
       (2, 2, 40.00, 'Bob'),
       (3, 3, 15.75, 'Charlie');

-- Ajouter des OrderItems associés.
INSERT INTO OrderItems (IdOrderItem, IdOrders, IdDish, Quantity)
VALUES (1, 1, 1, 2),
       (2, 1, 2, 1),
       (3, 2, 3, 3);

-- Calculer pour chaque commande : (Nombre total d’articles / montant total)
SELECT co.IdOrders, SUM(oi.Quantity) AS "TotalItems", co.Total_amount, SUM(oi.Quantity) / co.Total_amount AS "ItemsPerAmount"
FROM CustomerOrders co
JOIN OrderItems oi ON co.IdOrders = oi.IdOrders
GROUP BY co.IdOrders, co.Total_amount;


-- Lister les commandes triées par montant décroissant.
SELECT IdOrders, Total_amount
FROM CustomerOrders
ORDER BY Total_amount DESC;