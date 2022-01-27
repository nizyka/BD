SELECT Clients.name, Clients.surname, Clients.patronymic, Model.title_model, Automobile.number_auto, Renta.date_start_ren
FROM Renta INNER JOIN Automobile
ON Renta.id_auto = Automobile.id_automobile
INNER JOIN Clients
ON Renta.id_clients = Clients.id_cle
INNER JOIN Model
ON Automobile.id_model = Model.id_mod
WHERE Renta.date_start_ren > '2015-03-01' AND Renta.date_start_ren < '2015-07-01'