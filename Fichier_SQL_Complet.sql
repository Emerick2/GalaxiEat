-- Mise en place des tables (DDL)

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



-- Ajouts et modifications de colonnes

ALTER TABLE Employees
ADD COLUMN hire_date DATE;

ALTER TABLE Dishes
ADD COLUMN is_vegan BOOLEAN;

ALTER TABLE Orders
RENAME TO CustomerOrders;



-- Insérer de la donnée (libre de choix)

    -- Restaurants:
INSERT INTO Restaurants ("Name", "Planet")
VALUES ("Milky Way Diner", "Terre");

INSERT INTO Restaurants ("Name", "Planet")
VALUES ("Cresheano", "Lunne");

INSERT INTO Restaurants ("Name", "Planet")
VALUES ("MiamMiam", "Pluton");

INSERT INTO Restaurants ("Name", "Planet")
VALUES ("SuperBon", "Soleil (5ème arrondisement)");

    -- Dishes:
INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("Burger d’Astéroïde", 12.5, "Burgers");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("pizzas à l’antimatière douce", 5.31, "Pizza");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("pizza d’Astéroïde", 9.31, "pizza");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("pizza a la pizza", 12.5, "pizza");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("Burger à la pizza d’antimatière douce", 31, "Burgers");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("smoothies de nébuleuse", 2.60, "Smoothies");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("smoothies au choux fleur", 3, "Smoothies");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("smoothies à la pizza de burger", 11, "Smoothies");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("Quiche à la poussière d'étoile", 16, "Quiche");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("Quiche nature", 7, "Quiche");

INSERT INTO Dishes ("Name", "Price", "Category")
VALUES ("Quiche au caramel", 14.12, "Quiche");

    -- Employees:
INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Zorglub", "Bidoum", "Chef cuisinier", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Jannah", "Lefebvre", "plongeur", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Lily", "Sanchez", "plongeur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Enzo", "Muller", "plongeur", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Loan", "Roussel", "plongeur", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Zoé", "Fabre", "plongeur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Apolline", "Blanc", "plongeur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Eva", "Bertrand", "plongeur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Arthur", "Guerin", "plongeur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Suzanne", "Roche", "plongeur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Inaya", "Petit", "plongeur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Gaspard", "Simon", "plongeur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Théo", "Moreau", "plongeur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Yasmine", "Morin", "commis de cuisine", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Adèle", "Arnaud", "commis de cuisine", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Soan", "Lecomte", "commis de cuisine", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Nathan", "Masson", "commis de cuisine", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Margot", "Mercier", "cuisinier", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Victor", "Fontaine", "cuisinier", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Auguste", "Boyer", "cuisinier", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Roméo", "Meunier", "cuisinier", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Yanis", "Renard", "cuisinier", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Roméo", "Garcia", "cuisinier", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Alexandre", "Sanchez", "cuisinier", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Zayn", "Olivier", "cuisinier", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Léonie", "Thomas", "serveur", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Marie", "Richard", "serveur", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Joséphine", "Boyer", "serveur", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Noah", "Philippe", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Zayn", "Martinez", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Louna", "Leroy", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Marin", "Renard", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Lana", "Robert", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Mathis", "Vidal", "serveur", 4);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Enzo", "Martinez", "serveur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Marceau", "Noel", "serveur", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Chloé", "Roux", "chef cuisinier", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Eden", "Roche", "chef cuisinier", 1);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Camille", "Robert", "chef cuisinier", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Gabin", "Lopez", "chef cuisinier", 3);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Théo", "Durand", "chef cuisinier", 2);

INSERT INTO Employees ("Firstname", "Lastname", "Role", "IdRestaurant")
VALUES ("Julia", "Payet", "chef cuisinier", 1);



-- Premières requêtes

    -- Lister tous les restaurants de la galaxie.
SELECT Name 
FROM Restaurants;

    -- Lister tous les plats classés par prix décroissant.
SELECT Name, Price
FROM Dishes
ORDER BY Price DESC;

    -- Lister tous les employés triés par rôle.
SELECT FirstName, LastName, Role
FROM Employees
ORDER BY Role;

    -- Lister tous les plats végétariens
SELECT Name
FROM Dishes
WHERE is_vegan = TRUE;

    -- Lister les plats dont le prix est supérieur à la moyenne des prix.
SELECT Name, Price
FROM Dishes
WHERE Price > (SELECT AVG(Price) FROM Dishes);



-- Gestion des null

    -- Trouver les plats dont le champ is_vegan n’a pas encore été rempli. 
SELECT Dishes."Name"
FROM Dishes
WHERE Dishes."is_vegan" IS NULL;

	-- Trouver les employés dont la hire_date est NULL.
SELECT Employees."Firstname"
FROM Employees
WHERE Employees."hire_date" IS NULL;



-- Création et gestion des commandes

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
SELECT IdOrders, SUM(Quantity) AS TotalItems, Total_amount, SUM(Quantity) / Total_amount AS ItemsPerAmount
FROM CustomerOrders co
JOIN OrderItems oi ON co.IdOrders = oi.IdOrders
GROUP BY IdOrders, Total_amount;

    -- Lister les commandes triées par montant décroissant.
SELECT IdOrders, Total_amount
FROM CustomerOrders
ORDER BY Total_amount DESC;



-- Jointures

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



-- Mise à jour intelligente

SELECT Dishes."Name",
Dishes."Category",
Dishes."is_vegan",
CASE
	WHEN Dishes."Price" > 12
		THEN Dishes."Price"*1.10
	ELSE Dishes."Price"*1.05
END "Price"
FROM Dishes;



-- Suppressions

    -- Supprimer tous les plats à prix NULL (si existant)
DELETE FROM Dishes WHERE Price IS NULL;

    -- Supprimer les commandes de test dont le total est inférieur à 5.
DELETE FROM CustomerOrders WHERE Total_amount < 5;



-- Mini-analyse finale

    -- Prix moyen des plats par catégorie.
SELECT Category, AVG(Price) AS AveragePrice
FROM Dishes
GROUP BY Category;

    -- Montant total des ventes.
SELECT SUM(Total_amount) AS TotalSales
FROM CustomerOrders;
    
    -- Les 3 plats les plus chers.
SELECT Name, Price
FROM Dishes
ORDER BY Price DESC
LIMIT 3;

    -- Les employés dont le nom contient la lettre “a”
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '%a%' OR LastName LIKE '%a%';



-- Bonus

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
ORDER BY CustomerOrders."Total_amount" DESC
LIMIT 1;

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