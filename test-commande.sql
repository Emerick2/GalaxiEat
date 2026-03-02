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