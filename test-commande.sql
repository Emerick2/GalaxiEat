-- Créé une commande.
INSERT INTO CustomerOrders (IdRestaurant, Total_amount, Customer_name) 
VALUES (1, 25.50, 'tom');

-- On ajoute au clien précédant (IdOrders=1) un plat.
INSERT INTO OrderItems (IdOrders, IdDishes, Quantity) 
VALUES (1, 3, 1);

-- Commande la plus haute de la semaine.
SELECT Customer_name, Total_amount 
FROM CustomerOrders
ORDER BY Total_amount DESC 
LIMIT 1;

-- Liste des plats commandés avec : (name (Dishes) / (name of customers) /  planète (Restaurant)) 
SELECT 
    D.Name AS "Nom du plat", 
    CO.Customer_name AS "Nom du client", 
    R.Planet AS "Planete"
FROM OrderItems OI
JOIN Dishes D ON OI.IdDishes = D.IdDishes
JOIN CustomerOrders CO ON OI.IdOrders = CO.IdOrders
JOIN Restaurants R ON CO.IdRestaurant = R.IdRestaurant;




-- Autres :

    -- Un client commande une pizza, puis un smoothie
INSERT INTO CustomerOrders (IdOrders, IdRestaurant, Total_amount, Customer_name)
VALUES (1, 1, 16.00, 'John Doe'),
	(2, 1, 8.00, 'John Doe'),
	(3, 2, 24.00, 'Jane Smith')
ON CONFLICT(IdOrders) DO UPDATE SET
	IdRestaurant = excluded.IdRestaurant,
	Total_amount = excluded.Total_amount,
	Customer_name = excluded.Customer_name;
INSERT INTO OrderItems (IdOrderItems, IdOrders, IdDishes, Quantity)
VALUES (1, 1, 1, 1), -- Pizza Margherita
	(2, 1, 4, 1) -- Smoothie Fraise
ON CONFLICT(IdOrderItems) DO UPDATE SET
	IdOrders = excluded.IdOrders,
	IdDishes = excluded.IdDishes,
	Quantity = excluded.Quantity;

-- Obtenir le total des commandes par client et ne garder que le plus élevé
SELECT Customer_name, SUM(Total_amount) AS TotalByCustomer
FROM CustomerOrders
GROUP BY Customer_name
HAVING SUM(Total_amount) = (
	SELECT MAX(CustomerTotal)
	FROM (
		SELECT SUM(Total_amount) AS CustomerTotal
		FROM CustomerOrders
		GROUP BY Customer_name
	) AS totals
);