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