--Creating a database for toyota make and models
CREATE DATABASE toyota_cars;
show databases;
USE toyota_cars;
SELECT database();


--Create table for Toyota Inventory
CREATE TABLE toyota_cars.ToyotaInventory (
id INT primary key NOT NULL,
year_manufactured year NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
variant VARCHAR(50),
type_of_fuel VARCHAR(50)
);

DROP TABLE toyota_cars.ToyotaInventory;

--Inserting data into the Toyota_cars table 
INSERT INTO toyota_cars.ToyotaInventory (id, year_manufactured, make, model, variant, type_of_fuel)
VALUES (1, 2023, "Toyota", "RAV4", "XLE", "Gasoline"),
(2, 2023, "Toyota", "Camry", "LE", "Hybrid"),
(3, 2024, "Toyota", "Crown", "Limited", "Hybrid"),
(4, 2024, "Toyota", "Corolla", "LE", "Gasoline"),
(5, 2024, "Toyota", "RAV4", "XLE", "Hybrid"),
(6, 2024, "Toyota", "RAV4", "LE", "Gasoline"),
(7, 2024, "Toyota", "RAV4", "XSE", "Plug-in Hybrid"),
(8, 2024, "Toyota", "Sienna", "Limited", "Hybrid"),
(9, 2023, "Toyota", "Corolla Cross", "LE", "Gasoline"),
(10, 2024, "Toyota", "Grand Highlander", "XLE", "Hybrid"),
(11, 2024, "Toyota", "Grand Highlander", "Limited", "Hybrid"),
(12, 2023, "Toyota", "Highlander", "XSE", "Gasoline"),
(13, 2024, "Toyota", "Highlander", "Limited", "Gasoline"),
(14, 2024, "Toyota", "Highlander", "XLE", "Hybrid"),
(15, 2024, "Toyota", "Sienna", "LE", "Hybrid"),
(16, 2023, "Toyota", "bz4x", "XLE", "Electric"),
(17, 2024, "Toyota", "Prius", "Base", "Hybrid"),
(18, 2024, "Toyota", "Crown", "XLE", "Hybrid"),
(19, 2023, "Toyota", "Corolla Cross", "LE", "Hybrid"),
(20, 2024, "Toyota", "RAV4", "XSE", "Plug-in Hybrid"),
(21, 2023, "Toyota", "Camry", "SE", "Gasoline"),
(22, 2023, "Toyota", "Camry", "XSE", "Gasoline"),
(23, 2023, "Toyota", "Camry", "SE", "Hybrid"),
(24, 2023, "Toyota", "Camry", "LE", "Hybrid"),
(25, 2024, "Toyota", "RAV4", "LE", "Gasoline"),
(26, 2023, "Toyota", "Corolla", "LE", "Gasoline"),
(27, 2023, "Toyota", "Corolla", "LE", "Gasoline"),
(28, 2023, "Toyota", "Corolla", "LE", "Gasoline"),
(29, 2023, "Toyota", "Corolla", "LE", "Gasoline"),
(30, 2023, "Toyota", "Corolla", "SE", "Gasoline"),
(31, 2024, "Toyota", "Sienna", "XLE", "Hybrid"),
(32, 2024, "Toyota", "Prius Prime", "N/A", "Plug-in Hybrid"),
(33, 2019, "Toyota", "Yaris iA", "LE", "Gasoline"),
(34, 2024, "Toyota", "RAV4", "Adventure", "Gasoline"),
(35, 2024, "Toyota", "RAV4", "Adventure", "Gasoline"),
(36, 2024, "Toyota", "RAV4", "Adventure", "Gasoline"),
(37, 2020, "Toyota", "RAV4", "Adventure", "Gasoline"),
(38, 2023, "Toyota", "Highlander", "LE", "Gasoline"),
(39, 2022, "Toyota", "Camry", "SE", "Hybrid"),
(40, 2024, "Toyota", "RAV4", "XLE", "Gasoline");


--Lets preview the data in the table
SELECT * FROM toyota_cars.ToyotaInventory LIMIT 15;

--Order by year of manufacture
SELECT year_manufactured, make, model, variant, type_of_fuel FROM toyota_cars.ToyotaInventory
ORDER BY year_manufactured;

--Identify the outdated vehicles that need to be dropped from the inventory

SELECT * FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;

--Basically since it is 2024, the vehicles prior to 2023 need to be removed
DELETE FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;


--Now let's check to see if the outdated vehicles are still in the inventory
SELECT * FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;

--The query above returned empty results, thus the outdated vehicles have been removed

--Now, let's check the count of the number of gasoline, all-electric, hybrid, and plug-in hybrid vehicles
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Gasoline";
--Result: 19
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Hybrid";
--Result: 14
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Plug-in Hybrid";
--Result: 3
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Electric";
--1

--Okay, let's try to insert these values DIRECTLY onto another table
CREATE TABLE toyota_cars.NumberOfVehicleTypes (
gasoline INT NOT NULL,
hybrid INT NOT NULL,
phev INT NOT NULL,
ev INT NOT NULL
);

INSERT INTO toyota_cars.NumberOfVehicleTypes (gasoline, hybrid, phev, ev)
VALUES (SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Gasoline", SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Hybrid", SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Plug-in Hybrid", SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Electric");
--The SQL Syntax above is not supported, so we will go ahead and insert the counts manually

INSERT INTO toyota_cars.NumberOfVehicleTypes (gasoline, hybrid, phev, ev)
VALUES (19, 14, 3, 1);

SELECT * FROM toyota_cars.NumberOfVehicleTypes;
