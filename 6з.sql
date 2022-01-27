SELECT Automobile.year_of_manufacture_auto, MAX(Automobile.rent_cost_per_dat_auto) AS RentPerDayMAX, MIN(Automobile.rent_cost_per_dat_auto) AS RentPerDayMIN
FROM Automobile
GROUP BY Automobile.year_of_manufacture_auto