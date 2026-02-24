SELECT Dishes."Name",
Dishes."Category",
Dishes."is_vegan",
CASE
	WHEN Dishes."Price" > 12
		THEN Dishes."Price"*1.10
	ELSE Dishes."Price"*1.05
END "Price"
FROM Dishes;