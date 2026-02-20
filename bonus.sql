-- Créer une table Ingredients
CREATE TABLE Ingredients (
	IdIngredient INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name VARCHAR(50)
)

-- relation DishIngredients 
ALTER TABLE Dishes
ADD COLUMN Dishes."DishIngredients";

-- Générer un "menu vegan"
SELECT *
FROM Dishes
WHERE Dishes."is_vegan" IS NOT NULL;

-- Créer un classement des restaurants par ancienneté 
SELECT *
FROM Restaurants
ORDER BY Restaurants."Opening_year" ASC;

-- Simuler une "commande la plus haute de la semaine"
SELECT *
FROM CustomerOrders
ORDER BY COUNT(CustomerOrders."Total_amount") DESC
LIMIT 1;
