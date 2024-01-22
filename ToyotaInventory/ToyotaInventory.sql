#Creating a database for toyota make and models
CREATE DATABASE toyota_cars;
show databases;
USE toyota_cars;
SELECT database();


#Create table for Toyota Inventory
CREATE TABLE toyota_cars.ToyotaInventory (
id INT primary key NOT NULL,
year_manufactured year NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
variant VARCHAR(50),
type_of_fuel VARCHAR(50)
);

DROP TABLE toyota_cars.ToyotaInventory;

#Inserting data into the Toyota_cars table 
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


#Lets preview the data in the table
SELECT * FROM toyota_cars.ToyotaInventory;

#Order by year of manufacture
SELECT year_manufactured, make, model, variant, type_of_fuel FROM toyota_cars.ToyotaInventory
ORDER BY year_manufactured;

#Identify the outdated vehicles that need to be dropped from the inventory

SELECT * FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;

#Basically since it is 2024, the vehicles prior to 2023 need to be removed
DELETE FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;

#Now let's check to see if the outdated vehicles are still in the inventory
SELECT * FROM toyota_cars.ToyotaInventory
WHERE year_manufactured < 2023;

#The query above returned empty results, thus the outdated vehicles have been removed

#Now, let's check the count of the number of gasoline, all-electric, hybrid, and plug-in hybrid vehicles
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Gasoline";
#Result: 19
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Hybrid";
#Result: 14
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Plug-in Hybrid";
#Result: 3
SELECT COUNT(*) FROM toyota_cars.ToyotaInventory
WHERE type_of_fuel = "Electric";
#1

#Okay, let's try to insert these values DIRECTLY onto another table
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
#The SQL Syntax above is not supported, so we will go ahead and insert the counts manually

INSERT INTO toyota_cars.NumberOfVehicleTypes (gasoline, hybrid, phev, ev)
VALUES (19, 14, 3, 1);

SELECT * FROM toyota_cars.NumberOfVehicleTypes;

#Let's create a table containing inventory of older model Toyotas
#The purpose of this exercise is to perform joins on the two tables
CREATE TABLE toyota_cars.ToyotaInventory_OLD (
id INT primary key NOT NULL,
year_manufactured year NOT NULL,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
variant VARCHAR(50),
type_of_fuel VARCHAR(50)
);


INSERT INTO toyota_cars.ToyotaInventory_OLD (id, year_manufactured, make, model, variant, type_of_fuel)
VALUES (1, 2013, "Toyota", "Sienna", "XLE", "Gasoline"),
(2, 2012, "Toyota", "Camry", "LE", "Hybrid"),
(3, 2011, "Toyota", "Avalon", "XLS", "Gasoline"),
(4, 2014, "Toyota", "Corolla", "L", "Gasoline"),
(5, 2015, "Toyota", "RAV4", "XLE", "Gasoline"),
(6, 2009, "Toyota", "Matrix", "S", "Gasoline"),
(7, 2016, "Toyota", "Sienna", "LE", "Gasoline"),
(8, 2014, "Toyota", "Sienna", "Limited", "Gasoline"),
(9, 2011, "Toyota", "FJ Cruiser", "Base", "Gasoline"),
(10, 2014, "Toyota", "Highlander", "XLE", "Gasoline"),
(11, 2015, "Toyota", "Highlander", "Limited", "Hybrid"),
(12, 2012, "Toyota", "Camry", "SE", "Gasoline"),
(13, 2014, "Toyota", "Camry", "XLE", "Hybrid"),
(14, 2017, "Toyota", "Corolla", "XSE", "Gasoline"),
(15, 2018, "Toyota", "Sienna", "L", "Gasoline"),
(16, 2013, "Toyota", "Yaris", "L", "Gasoline"),
(17, 2014, "Toyota", "Prius", "Base", "Hybrid"),
(18, 2015, "Toyota", "Camry", "LE", "Hybrid"),
(19, 2019, "Toyota", "RAV4", "XLE", "Gasoline"),
(20, 2013, "Toyota", "RAV4", "Limited", "Gasoline"),
(21, 2013, "Toyota", "Camry", "SE", "Gasoline"),
(22, 2017, "Toyota", "Camry", "XSE", "Gasoline"),
(23, 2018, "Toyota", "Corolla", "XLE", "Gasoline"),
(24, 2018, "Toyota", "Sequoia", "Limited", "Gasoline"),
(25, 2017, "Toyota", "Highlander", "LE", "Hybrid"),
(26, 2020, "Toyota", "Corolla", "LE", "Hybrid"),
(27, 2020, "Toyota", "Corolla", "XSE", "Gasoline"),
(28, 2010, "Toyota", "Corolla", "CE", "Gasoline"),
(29, 2011, "Toyota", "Corolla", "S", "Gasoline"),
(30, 2014, "Toyota", "Corolla", "LE Plus", "Gasoline"),
(31, 2024, "Toyota", "Sienna", "XLE", "Hybrid"),
(32, 2015, "Toyota", "Prius Prime", "N/A", "Plug-in Hybrid"),
(33, 2019, "Toyota", "Yaris iA", "LE", "Gasoline"),
(34, 2009, "Toyota", "Sienna", "CE", "Gasoline"),
(35, 2013, "Toyota", "RAV4", "N/A", "Electric"),
(36, 2012, "Toyota", "Prius C", "3", "Hybrid"),
(37, 2013, "Toyota", "Prius C", "2", "Hybrid"),
(38, 2016, "Toyota", "Prius V", "Base", "Hybrid"),
(39, 2012, "Toyota", "Prius V", "3", "Hybrid"),
(40, 2018, "Toyota", "RAV4", "SE", "Gasoline");

SELECT * FROM toyota_cars.ToyotaInventory_OLD;


#Inner Join on model of the vehicle
#Let's use aliases to make the code look cleaner
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
INNER JOIN toyota_cars.ToyotaInventory_OLD AS OLD
ON LATEST.model = OLD.model;

#Left Join on model of the vehicle
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
LEFT JOIN toyota_cars.ToyotaInventory_OLD AS OLD
ON LATEST.model = OLD.model;
#Notice how you see some null values in the results, because some of the models in the LATEST table do not exist in the OLD table

#Right Join on model of the vehicle
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
RIGHT JOIN toyota_cars.ToyotaInventory_OLD AS OLD
ON LATEST.model = OLD.model;
#Notice how you see some null values in the results, because some of the models in the OLD table do not exist in the LATEST table


#Full Join on model of the vehicle
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
LEFT JOIN toyota_cars.ToyotaInventory_OLD AS OLD
ON LATEST.model = OLD.model
UNION
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
RIGHT JOIN toyota_cars.ToyotaInventory_OLD AS OLD
ON LATEST.model = OLD.model;
#We have to do a union on LEFT join and RIGHT join since MySQL does not support FULL OUTER JOIN syntax.

#Cross Join
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
CROSS JOIN toyota_cars.ToyotaInventory_OLD AS OLD;

#Natural Join
SELECT LATEST.year_manufactured, LATEST.make, LATEST.model, LATEST.variant, LATEST.type_of_fuel, OLD.year_manufactured, OLD.make, OLD.model, OLD.variant, OLD.type_of_fuel
FROM toyota_cars.ToyotaInventory AS LATEST
NATURAL JOIN toyota_cars.ToyotaInventory_OLD AS OLD;
#Natural join will join tables by all columns with ONLY the same names

