--  Liste des employés avec le nom de leur restaurant. 
SELECT Employees."Firstname" ||  ' ' || Employees."Lastname" AS "Nom de l'employé", Restaurants."Name" AS "Nom du restaurent"
FROM Employees
JOIN Restaurants ON Restaurants."IdRestaurant" = Employees."IdRestaurant";

-- Liste des plats commandés avec : (name (Dishes) / (name of customers) /  planète (Restaurant)) 
SELECT DISTINCT Dishes."Name" AS "Dishes", CustomerOrders."Customer_name" AS "name of customers", Restaurants."Name" || ' - ' || Restaurants."Planet" AS "Restaurant"
FROM OrderItems
JOIN Dishes ON Dishes."IdDishes" = OrderItems."IdDishes"
JOIN CustomerOrders ON CustomerOrders."IdOrders" = OrderItems."IdOrders"
JOIN Restaurants ON Restaurants."IdRestaurant" = CustomerOrders."IdRestaurant";

-- Lister tous les restaurants avec leur nombre d’employés.

SELECT COUNT(Employees."IdRestaurant" = Restaurants."IdRestaurant") AS "nombre d’employés", Restaurants."Name" AS "Nom du restaurant"
FROM Restaurants
JOIN Employees ON Employees."IdRestaurant" = Restaurants."IdRestaurant"
GROUP BY Restaurants."IdRestaurant";
