-- Créer une table Ingredients
CREATE TABLE Ingredients (
	IdIngredient INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name VARCHAR(50)
	is_vegan BOOLEAN;
);

-- relation DishIngredients 
CREATE TABLE DishIngredients (
	IdDishIngredients INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	IdIngredient INTEGER NOT NULL,
	IdDish INTEGER NOT NULL
);

-- Générer un "menu vegan"
SELECT *
FROM Dishes
WHERE Dishes."is_vegan" = "True";

-- Créer un classement des restaurants par ancienneté 
SELECT *
FROM Restaurants
ORDER BY Restaurants."Opening_year" ASC;

-- Simuler une "commande la plus haute de la semaine"
SELECT *
FROM CustomerOrders
ORDER BY COUNT(CustomerOrders."Total_amount") DESC
LIMIT 1;
