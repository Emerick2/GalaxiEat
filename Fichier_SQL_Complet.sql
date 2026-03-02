---- Création de l’univers "GalaxiEat". ----
-- Mise en place des tables.
CREATE TABLE "Restaurants" (
	IdRestaurant INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name VARCHAR(50),
	Planet VARCHAR(50),
	Opening_year INTEGER
);

CREATE TABLE "Employees" (
	IdEmployees INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Firstname VARCHAR(50),
	Lastname VARCHAR(50),
	Role VARCHAR(50),
	IdRestaurant INTEGER
);

CREATE TABLE "Dishes" (
	IdDishes INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name VARCHAR(50),
	Price INTEGER,
	Category VARCHAR(50)
);

CREATE TABLE "Orders" (
	IdOrders INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	IdRestaurant INTEGER,
	Total_amount INTEGER,
	Customer_name VARCHAR(50)
);

CREATE TABLE "OrderItems" (
	IdOrderItems INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	IdOrders INTEGER,
	IdDishes INTEGER,
	Quantity INTEGER
);

-- Ajouts et modifications de colonnes.
ALTER TABLE Employees
ADD COLUMN hire_date DATE;

ALTER TABLE Dishes
ADD COLUMN is_vegan BOOLEAN;

ALTER TABLE Orders
RENAME TO CustomerOrders;



---- Insérer de la donnée. ----
-- Table "Restaurants".
INSERT INTO Restaurants ("Name", "Planet", "Opening_year")
VALUES 	("Milky Way Diner", "Terre", 2467),
		("Cresheano", "Lunne", 2452),
		("MiamMiam", "Pluton", 2331),
		("SuperBon", "Soleil (5ème arrondisement)", 2477);

-- Table "Dishes".
INSERT INTO Dishes ("Name", "Price", "Category")
VALUES 	("Burger d’Astéroïde", 12.5, "Burgers"),
		("pizzas à l’antimatière douce", 5.31, "Pizza"),
		("pizza d’Astéroïde", 9.31, "pizza"),
		("pizza a la pizza", 12.5, "pizza"),
		("Burger à la pizza d’antimatière douce", 31, "Burgers"),
		("smoothies de nébuleuse", 2.60, "Smoothies"),
		("smoothies au choux fleur", 3, "Smoothies"),
		("smoothies à la pizza de burger", 11, "Smoothies"),
		("Quiche à la poussière d'étoile", 16, "Quiche"),
		("Quiche nature", 7, "Quiche"),
		("Quiche au caramel", 14.12, "Quiche");

-- Table "Employees".
INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant","hire_date")
VALUES 	("Zorglub", "Bidoum", "Chef cuisinier", 1, 2471),
		("Jannah", "Lefebvre", "plongeur", 2, 2453),
		("Lily", "Sanchez", "plongeur", 1, 2470),
		("Enzo", "Muller", "plongeur", 2, 2468),
		("Loan", "Roussel", "plongeur", 3, 2413),
		("Zoé", "Fabre", "plongeur", 4, 2479),
		("Apolline", "Blanc", "plongeur", 1, 2483),
		("Eva", "Bertrand", "plongeur", 1, 2480),
		("Arthur", "Guerin", "plongeur", 1, 2476),
		("Suzanne", "Roche", "plongeur", 4, 2482),
		("Inaya", "Petit", "plongeur", 1, 2473),
		("Gaspard", "Simon", "plongeur", 4, 2486),
		("Théo", "Moreau", "plongeur", 4, 2485),
		("Yasmine", "Morin", "commis de cuisine", 3, 2400),
		("Adèle", "Arnaud", "commis de cuisine", 1, 2468),
		("Soan", "Lecomte", "commis de cuisine", 3, 2431),
		("Nathan", "Masson", "commis de cuisine", 3, 2420),
		("Margot", "Mercier", "cuisinier", 2, 2452),
		("Victor", "Fontaine", "cuisinier", 2, 2456),
		("Auguste", "Boyer", "cuisinier", 2, 2468),
		("Roméo", "Meunier", "cuisinier", 2, 2453),
		("Yanis", "Renard", "cuisinier", 1, 2469),
		("Roméo", "Garcia", "cuisinier", 1, 2470),
		("Alexandre", "Sanchez", "cuisinier", 3, 2401),
		("Zayn", "Olivier", "cuisinier", 3, 2420),
		("Léonie", "Thomas", "serveur", 3, 2423),
		("Marie", "Richard", "serveur", 3, 2413),
		("Joséphine", "Boyer", "serveur", 3, 2479),
		("Noah", "Philippe", "serveur", 4, 2477),
		("Zayn", "Martinez", "serveur", 4, 2482),
		("Louna", "Leroy", "serveur", 4, 2479),
		("Marin", "Renard", "serveur", 4, 2483),
		("Lana", "Robert", "serveur", 4, 2486),
		("Mathis", "Vidal", "serveur", 4, 2486),
		("Enzo", "Martinez", "serveur", 1, 2481),
		("Marceau", "Noel", "serveur", 1, 2483),
		("Chloé", "Roux", "chef cuisinier", 1, 2482),
		("Eden", "Roche", "chef cuisinier", 1, 2486),
		("Camille", "Robert", "chef cuisinier", 3, 2416),
		("Gabin", "Lopez", "chef cuisinier", 3, 2453),
		("Théo", "Durand", "chef cuisinier", 2, 2458),
		("Julia", "Payet", "chef cuisinier", 1, 2476);



---- Premières requêtes. ----
-- Lister tous les restaurants de la galaxie.
SELECT Restaurants.Name 
FROM Restaurants;

-- Lister tous les plats classés par prix décroissant.
SELECT Dishes.Name, Dishes.Price
FROM Dishes
ORDER BY Dishes.Price DESC;

-- Lister tous les employés triés par rôle.
SELECT Employees.FirstName, Employees.LastName, Employees.Role
FROM Employees
ORDER BY Employees.Role;

-- Lister tous les plats végétariens.
SELECT Dishes.Name
FROM Dishes
WHERE Dishes.is_vegan = "True";

-- Lister les plats dont le prix est supérieur à la moyenne des prix.
SELECT Dishes.Name, Dishes.Price
FROM Dishes
WHERE Dishes.Price > (SELECT AVG(Dishes.Price) FROM Dishes);



---- Gestion des null. ----
-- Trouver les plats dont le champ is_vegan n’a pas encore été rempli. 
SELECT Dishes.Name
FROM Dishes
WHERE Dishes.is_vegan IS NULL;

-- Trouver les employés dont la hire_date est NULL.
SELECT Employees.Firstname
FROM Employees
WHERE Employees.hire_date IS NULL;



---- Création et gestion des commandes. ----
-- 3 commandes dans différents restaurants.
INSERT INTO CustomerOrders (IdRestaurant, Total_amount, CustomerName)
VALUES 	(1, 25.50, 'Alice'),
       	(2, 40.00, 'Bob'),
       	(3, 15.75, 'Charlie');

-- Ajouter des OrderItems associés.
INSERT INTO OrderItems (IdOrders, IdDish, Quantity)
VALUES 	(1, 1, 2),
       	(1, 2, 1),
       	(2, 3, 3),
	   	(3, 6, 4);

-- Calculer pour chaque commande : (Nombre total d’articles / montant total).
SELECT co.IdOrders, SUM(oi.Quantity) AS "TotalItems", co.Total_amount, SUM(oi.Quantity) / co.Total_amount AS "ItemsPerAmount"
FROM CustomerOrders co
JOIN OrderItems oi ON co.IdOrders = oi.IdOrders
GROUP BY co.IdOrders, co.Total_amount;

-- Lister les commandes triées par montant décroissant.
SELECT CustomerOrders.IdOrders, CustomerOrders.Total_amount
FROM CustomerOrders
ORDER BY CustomerOrders.Total_amount DESC;



---- Jointures. ----
--  Liste des employés avec le nom de leur restaurant. 
SELECT Employees.Firstname ||  ' ' || Employees.Lastname AS "Nom de l'employé", Restaurants.Name AS "Nom du restaurent"
FROM Employees
JOIN Restaurants ON Restaurants.IdRestaurant = Employees.IdRestaurant;

-- Liste des plats commandés avec : (name (Dishes) / (name of customers) /  planète (Restaurant)).
SELECT DISTINCT Dishes.Name AS "Dishes", CustomerOrders.Customer_name AS "name of customers", Restaurants.Name || ' - ' || Restaurants.Planet AS "Restaurant"
FROM OrderItems
JOIN Dishes ON Dishes.IdDishes = OrderItems.IdDishes
JOIN CustomerOrders ON CustomerOrders.IdOrders = OrderItems.IdOrders
JOIN Restaurants ON Restaurants.IdRestaurant = CustomerOrders.IdRestaurant;

-- Lister tous les restaurants avec leur nombre d’employés.
SELECT COUNT(Employees.IdRestaurant = Restaurants.IdRestaurant) AS "nombre d’employés", Restaurants.Name AS "Nom du restaurant"
FROM Restaurants
JOIN Employees ON Employees.IdRestaurant = Restaurants.IdRestaurant
GROUP BY Restaurants.IdRestaurant;



---- Mise à jour intelligente. ----
SELECT Dishes.Name,
Dishes.Category,
Dishes.is_vegan,
CASE
	WHEN Dishes.Price > 12
		THEN Dishes.Price*1.10
	ELSE Dishes.Price*1.05
END "Price"
FROM Dishes;



---- Suppressions. ----
-- Supprimer tous les plats à prix NULL (si existant).
DELETE FROM Dishes
WHERE Price IS NULL;

-- Supprimer les commandes de test dont le total est inférieur à 5.
DELETE FROM CustomerOrders
WHERE Total_amount < 5;



---- Mini-analyse finale. ----
-- Prix moyen des plats par catégorie.
SELECT Dishes.Category, AVG(Dishes.Price) AS "AveragePrice"
FROM Dishes
GROUP BY Dishes.Category;

-- Montant total des ventes.
SELECT SUM(CustomerOrders.Total_amount) AS "TotalSales"
FROM CustomerOrders;
    
-- Les 3 plats les plus chers.
SELECT Dishes.Name, Dishes.Price
FROM Dishes
ORDER BY Dishes.Price DESC
LIMIT 3;

-- Les employés dont le nom contient la lettre "a".
SELECT Employees.FirstName, Employees.LastName
FROM Employees
WHERE Employees.FirstName LIKE '%a%' OR Employees.LastName LIKE '%a%';



---- Bonus. ----
-- Créer une table "Ingredients".
CREATE TABLE Ingredients (
	IdIngredient INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	Name VARCHAR(50)
	is_vegan BOOLEAN
);

-- Relation DishIngredients.
ALTER TABLE Dishes
ADD COLUMN Dishes."DishIngredients";

-- Création d'un tableau DishIngredients :
CREATE TABLE DishIngredients (
	IdDishIngredients INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	IdIngredient INTEGER NOT NULL,
	IdDish INTEGER NOT NULL
);

-- Créé des ingrédiants.
INSERT INTO Ingredients ("Name", "is_vegan")
VALUES 	("Antimatière douce", "True"),
		("Astéroïde", "True"),
		("Jambon", "False"),
		("Fromage", "True"),
		("Pâte", "True"),
		("Sause tomate", "True"),
		("Pain", "True"),
		("Olive", "True"),
		("Salade", "True"),
		("Eau", "True"),
		("Jus de fruits", "True"),
		("Lait", "True"),
		("Jus de soja", "True"),
		("Nébuleuse", "True"),
		("Choux fleur", "True"),
		("Poussière d'étoile", "True"),
		("Caramel", "True");
		
-- Créé la liaison entre les ingrédiants et les plats.
INSERT INTO DishIngredients ("IdIngredient", "IdDishes")
VALUES 	(7, 1),
		(2, 1),
		(9, 1),
		(3, 1),
		(9, 2),
		(3, 2),
		(4, 2),
		(5, 2),
		(8, 2),
		(9, 2),
		(1, 3),
		(3, 3),
		(2, 3),
		(4, 3),
		(5, 3),
		(6, 3),
		(8, 3),
		(17, 3),
		(4, 4),
		(5, 4),
		(6, 4),
		(8, 4),
		(15, 4),
		(4, 5),
		(5, 5),
		(9, 5),
		(15, 5),
		(10, 6),
		(12, 6),
		(14, 6),
		(10, 7),
		(13, 7),
		(11, 7),
		(15, 7),
		(10, 8),
		(12, 8),
		(6, 8),
		(4, 8),
		(8, 8),
		(3, 9),
		(4, 9),
		(7, 9),
		(12, 9),
		(16, 9),
		(7, 10),
		(10, 10),
		(5, 11),
		(6, 11),
		(7, 11),
		(12, 11),
		(17, 11);

-- Mettre à jours la table Dishes pour savoir si le plat est végan.
UPDATE Dishes
SET "is_vegan" = (
	SELECT Ingredients."is_vegan"
	FROM Dishes d2
	JOIN DishIngredients ON DishIngredients."IdDishes" = d2."IdDishes"
	JOIN Ingredients ON Ingredients."IdIngredient" = DishIngredients."IdIngredient"
	WHERE Dishes."IdDishes" = d2."IdDishes"
	ORDER BY Ingredients."is_vegan"
	LIMIT 1
);

-- Générer un "menu vegan".
SELECT *
FROM Dishes
WHERE Dishes."is_vegan" = "True";

-- Créer un classement des restaurants par ancienneté.
SELECT *
FROM Restaurants
ORDER BY Restaurants."Opening_year" ASC;

-- Simuler une "commande la plus haute de la semaine".
SELECT *
FROM CustomerOrders
ORDER BY CustomerOrders."Total_amount" DESC
LIMIT 1;
