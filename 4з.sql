SELECT Automobile.number_auto, Model.title_model, Renta.date_start_ren, Automobile.rent_cost_per_dat_auto, Renta.number_of_days,
Automobile.rent_cost_per_dat_auto, Automobile.rent_cost_per_dat_auto * Renta.number_of_days AS RentalCost
FROM Renta INNER JOIN Automobile
ON Renta.id_auto = Automobile.id_automobile
INNER JOIN Model
ON Automobile.id_model = Model.id_mod
