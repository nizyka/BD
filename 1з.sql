SELECT *
FROM Automobile INNER JOIN Model
ON Automobile.ID_model = Model.id_mod
WHERE Model.title_model LIKE 'Audi' AND Automobile.year_of_manufacture_auto > 2009