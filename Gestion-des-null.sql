-- Trouver les plats dont le champ is_vegan n’a pas encore été rempli. 
SELECT Dishes."Name"
FROM Dishes
WHERE Dishes."is_vegan" IS null;

-- Trouver les employés dont la hire_date est NULL.
SELECT Employees."Firstname"
FROM Employees
WHERE Employees."hire_date" IS NULL;