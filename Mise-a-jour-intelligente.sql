SELECT Dishes."Name",
Dishes."Category",
Dishes."is_vegan",
CASE
	WHEN Dishes."Price" > 12
		THEN ROUND(Dishes."Price"*1.10,2)
	ELSE ROUND(Dishes."Price"*1.05,2)
END "Price"
FROM Dishes;