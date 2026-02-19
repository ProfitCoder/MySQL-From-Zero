create database clavesajenas;
use clavesajenas;

create table proveedor(
	pr varchar(5),
    nombre varchar(20),
    estado int,
    ciudad varchar(50),
    Primary Key(pr));
    
create table pieza(
	pz varchar(5),
    nombre varchar(20),
    color varchar(30),
    peso int,
    ciudad varchar(30),
    Primary key(pz));
    
create table suministro(
	codigo int,
    pr varchar(5),
    pz varchar(5),
    cantidad int,
    Primary key(codigo),
    foreign key (pr) references proveedor(pr),
    foreign key (pz) references pieza(pz));
    
drop table suministro;
    
insert into proveedor (pr,nombre,estado,ciudad) values ('S1','Salazar','20','Londres');
insert into proveedor (pr,nombre,estado,ciudad) values ('S2','Jaimes','10','París'),('S3','Bernal','30','París'),('S4','Corona','20','Londres'),('S5','Aldana','30','Atenas');

select * from proveedor;

insert into pieza (pz,nombre,color,peso,ciudad) values ('P1','tuerca','verde','12','París'),
													   ('P2','perno','rojo','17','Londres'),
                                                       ('P3','birlo','azul','17','Roma'),
                                                       ('P4','birlo','rojo','14','Londres'),
                                                       ('P5','birlo','azul','12','París'),
                                                       ('P6','engrane','rojo','19','París');
                                                       
select * from pieza;

insert into suministro (codigo,pr,pz,cantidad) values ('1','S1','P1','300'),
													  ('2','S1','P2','200'),
                                                      ('3','S1','P3','400'),
                                                      ('4','S1','P4','200'),
                                                      ('5','S1','P5','100'),
                                                      ('6','S1','P6','100'),
                                                      ('7','S2','P1','300'),
                                                      ('8','S2','P2','400'),
                                                      ('9','S3','P2','200'),
                                                      ('10','S4','P2','200'),
                                                      ('11','S4','P4','300'),
                                                      ('12','S4','P5','400');
                                                      
select * from suministro;

-- CASO 1)

-- Ejercicio 1 (No porque existe al menos un sumunistro con este proveedor)
delete from proveedor where pr='S1';
-- Ejercicio 2 (Si se puede borrar porque no existe suministro con este proveedor)
delete from proveedor where pr='S5';

-- Ejercicio 3 (Se pueden borrar los proveedores que no esten anexados a otra tabla distinta a la que estan, porque si no borrarias más datos en info)
delete from proveedor where pr!='S5'

-- Ejercicio 4 (No porque estan en mas de 1 unica tabla y se borrarian bastantes datos)

-- Ejercicio 5 (En general se pueden borrar todos)

-- Ejercicio 6 (No se puede insertar S1–P7–300 porque P7 no existe en PIEZA)

-- Ejercicio 7 (Sí se puede insertar S1–P6–200 porque S1 y P6 existen.)

-- Ejercicio 8 (Sí se puede insertar S2–P3–400 porque S2 y P3 existen.)

-- Ejercicio 9  (Se puede insertar un envío solo si el proveedor y la pieza existen previamente.)

-- Ejercicio 10  (No se puede borrar la pieza P6 porque aparece en SUMINISTRO.)

-- Ejercicio 11 (No se puede borrar ninguna pieza, porque todas aparecen en SUMINISTRO.)

-- CASO 2

-- Ejercicio 12 (No se puede borrar el proveedor S1 porque al propagar, SUMINISTRO borraría sus envíos, pero P2 quedaría sin proveedor válido, lo cual no está permitido por la FK PZ con RESTRINGIR.)

-- Ejercicio 13 (Sí se puede borrar el proveedor S5 porque no tiene envíos asociados.)

-- Ejercicio 14 (En general se pueden borrar todos los proveedores)

-- Ejercicio 15 (Sí se puede borrar el envío S1–P2 porque eliminar en SUMINISTRO no afecta a otras tablas.)

-- Ejercicio 16 (Se pueden borrar todos los envíos.)

-- Ejercicio 17 (No se puede insertar con pr=S7 porque el proveedor no existe; falla la FK con PROPAGAR.)
 
-- Ejercicio 18 (Sí se puede insertar S1–P6–200 porque S1 y P6 existen.)

-- Ejercicio 19 (Sí se puede insertar S2–P3–400 porque S2 y P3 existen.)

-- Ejercicio 20 (Se puede insertar un envío si el proveedor existe y la pieza existe.)

-- Ejercicio 21 (No se puede borrar la pieza P6 porque tiene envíos asociados y la restricción PZ es RESTRINGIR.)

-- Ejercicio 22 (No se puede borrar ninguna pieza, porque todas tienen envíos asociados.)

-- CASO 3

-- Ejercicio 23 (No se puede borrar proveedor S1 porque aunque PZ sea NULL, PR es RESTRINGIR y tiene envíos asociados.)

-- Ejercicio 24 (Sí se puede borrar proveedor S5 porque no tiene envíos.)

-- Ejercicio 25 (Se pueden borrar todos los proveedores sin envíos; solo S5.)

-- Ejercicio 26 (Sí se puede borrar cualquier envío; no hay restricciones que lo impidan.)

-- Ejercicio 27 (Se pueden borrar todos los envíos sin excepción.)

-- Ejercicio 28 (No se puede insertar S1–P7–300 porque la pieza no existe.)

-- Ejercicio 29 (Sí se puede insertar S1–P6–200 porque S1 y P6 existen.)

-- Ejercicio 30  (Sí se puede insertar S2–P3–400 porque S2 y P3 existen.)

-- Ejercicio 31 (Se puede insertar si el proveedor existe; la pieza puede ser NULL.)

-- Ejercicio 32 (No se puede borrar la pieza P6: aunque el campo PZ se pone NULL, sigue existiendo el envío y no se borrarían registros incoherentes.)

-- Ejercicio 33 (Solo se podrían borrar piezas que no estén en SUMINISTRO, pero todas aparecen, así que ninguna puede borrarse.)

-- CASO 4

-- Se propaga poniendo 'On update cascade' ejemplo (Foreign key (pz) references pieza (pz) on update cascade)

-- Ejercicio 1 (Sí se puede borrar S1 porque SUMINISTRO borra en cascada sus envíos.)

-- Ejercicio 2 (Sí se puede borrar S5 porque no tiene suministros)

-- Ejercicio 3 (Aquellos que aun no hayan suministrado nada)
update proveedor set pr='S6' where pr='S1';

-- Ejercicio 37 (Sí se puede borrar cualquier suministro)


-- Ejercicio 38 (Se pueden borrar todos los envíos.)

-- Ejercicio 39 (No se puede insertar S1–P7–300 porque P7 no existe.)

-- Ejercicio 40 (Sí se puede insertar S1–P6–300 porque existen.)

-- Ejercicio 41 (Sí se puede insertar S2–P3–400 porque existen.)

-- Ejercicio 42 (Se puede insertar siempre que proveedor y pieza existan.)

-- Ejercicio 43 (Sí se puede borrar P6 porque los envíos asociados se eliminan por cascada.)

-- Ejercicio 44 (Se pueden borrar todas las piezas porque se borran en cascada sus envíos.)



-- APARTADO DE BASE DE DATOS WORLD

use world;

show tables;
select * from city;

CREATE TABLE `city` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CountryCode` (`CountryCode`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE Country (
  Code char(3) NOT NULL,
  Name char(52) NOT NULL,
  Continent enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL,
  Region char(26) NOT NULL,
  SurfaceArea float(10,2) NOT NULL,
  IndepYear smallint(6) DEFAULT NULL,
  Population int(11) NOT NULL,
  LifeExpectancy float(3,1) DEFAULT NULL,
  GNP float(10,2) DEFAULT NULL,
  GNPOld float(10,2) DEFAULT NULL,
  LocalName char(45) NOT NULL,
  GovernmentForm char(45) NOT NULL,
  HeadOfState char(60) DEFAULT NULL,
  Capital int(11) DEFAULT NULL,
  Code2 char(2) NOT NULL,
  PRIMARY KEY (Code)
);

CREATE TABLE CountryLanguage (
  CountryCode char(3) NOT NULL,
  Language char(30) NOT NULL,
  IsOfficial enum('T','F') NOT NULL,
  Percentage float(3,1) NOT NULL,
  PRIMARY KEY (CountryCode, Language),
  FOREIGN KEY (CountryCode) REFERENCES Country(Code)
);


SELECT Code, Name FROM Country WHERE Code = 'XYZ';

SET FOREIGN_KEY_CHECKS = 0;
-- aquí cargas tus datos
SET FOREIGN_KEY_CHECKS = 1;



-- Ejercicios

-- 1)
SELECT ID, Name, Population
FROM City
LIMIT 10;

-- 2)
SELECT ID, Name, Population
FROM City
LIMIT 15, 5;

-- 3)
SELECT COUNT(*) AS TotalCities
FROM City;

-- 4)
SELECT Name, Population
FROM City
ORDER BY Population DESC
LIMIT 1;

-- 5)
SELECT Name, Population
FROM City
ORDER BY Population ASC
LIMIT 1;

-- 6)
SELECT Name, Population
FROM City
WHERE Population > 1000000;

-- 7)
SELECT Name
FROM City
WHERE Name LIKE 'Kal%';

-- 8)
SELECT *
FROM City
WHERE Name = 'Bratislava';

-- 9)
SELECT Name, Population
FROM City
WHERE Population BETWEEN 670000 AND 700000;

-- 10)
SELECT Name, Population
FROM City
ORDER BY Population DESC
LIMIT 10;

-- 11)
SELECT Name, Population
FROM City
ORDER BY Population ASC
LIMIT 10;

-- 12)
SELECT Name
FROM City
ORDER BY Name ASC
LIMIT 10;

-- 13)
SELECT SUM(Population) AS TotalNYPopulation
FROM City
WHERE District = 'New York';

-- 14)
SELECT c.District, SUM(c.Population) AS TotalPopulation
FROM City c
JOIN Country co ON c.CountryCode = co.Code
WHERE co.Code = 'USA'
GROUP BY c.District
HAVING SUM(c.Population) > 3000000;

-- 15)
SELECT Name, HeadOfState
FROM Country;


-- Relacion de ejercicios 3.1

-- 1)
select codigo, Name, continente, population 
from country;

-- 2)
select distinct language 
from countrylanguage;

-- 3)
select Name, Population 
from city;

-- 4)
SELECT Name, GNP AS `Producto Bruto Nacional`, GNPOld AS `Producto Bruto Nacional Anterior`, 
(GNP - GNPOld) AS Diferencia
FROM Country;

 -- 5)
SELECT Name, Population, SurfaceArea, Population / SurfaceArea AS Densidad 
FROM Country;

-- 6)
SELECT * 
FROM Country 
ORDER BY Population ASC;

-- 7)
SELECT Language 
FROM CountryLanguage 
ORDER BY Language;

-- 8)
SELECT Name, Population 
FROM City 
ORDER BY Population ASC LIMIT 20;

-- 9)
SELECT Code, Name, IndepYear 
FROM Country 
ORDER BY IndepYear ASC;

-- 10)
SELECT Name, Continent 
FROM Country 
WHERE LifeExpectancy IS NOT NULL 
ORDER BY LifeExpectancy DESC, SurfaceArea ASC LIMIT 100;

-- 11)
SELECT * FROM Country 
WHERE Population = 0;

-- 12)
SELECT * 
FROM Country 
WHERE LifeExpectancy > 75 
ORDER BY LifeExpectancy ASC;

-- 13)
SELECT * 
FROM Country 
WHERE IndepYear >= 1850 AND GovernmentForm = 'Constitutional Monarchy';

-- 14)
SELECT * 
FROM Country 
WHERE Continent = 'Europe' 
ORDER BY GNP DESC LIMIT 10;

-- 15)
SELECT * 
FROM Country 
WHERE Name = LocalName;

-- 16)
SELECT * 
FROM Country 
WHERE IndepYear >= 1950;

-- 17)
SELECT * 
FROM Country 
WHERE Continent IN ('Europe', 'Asia', 'South America');

-- 18)
SELECT * 
FROM Country 
WHERE Continent <> 'Africa';

-- 19)
SELECT * 
FROM City 
WHERE CountryCode = 'ARG' AND District <> 'Buenos Aires';

-- 20)
SELECT * FROM City WHERE Population BETWEEN 125000 AND 130000;

-- 21)
SELECT * FROM Country 
WHERE IndepYear IS NULL;

-- 22)
SELECT * 
FROM Country 
WHERE GNPOld IS NULL AND LifeExpectancy IS NULL;

-- 23)
SELECT * 
FROM Country 
WHERE Name LIKE 'A%' AND Name LIKE '%A';

-- 24)
SELECT * 
FROM Country 
WHERE Name LIKE '% %';

-- 25)
SELECT * 
FROM City 
WHERE Name LIKE '%-%' OR District LIKE '%-%';

-- 26)
SELECT c.Name AS Pais, ci.Name AS Capital 
FROM Country c JOIN City ci ON ci.ID = c.Capital 
WHERE c.Continent = 'South America';

-- 27)
SELECT c.Code, ci.Name, ci.Population 
FROM Country c JOIN City ci ON ci.CountryCode = c.Code 
WHERE c.LifeExpectancy > 80;

-- 28)
SELECT c.Name AS Pais, ci.Name AS Capital 
FROM Country c JOIN City ci ON ci.ID = c.Capital 
WHERE c.GovernmentForm = 'Federal Republic';

-- 29)
SELECT cl.Language, c.Name 
FROM CountryLanguage cl JOIN Country c ON c.Code = cl.CountryCode 
WHERE cl.IsOfficial = 'T' AND c.Population 
BETWEEN 1000000 AND 3000000;

-- 30)
SELECT c.Code, c.LocalName, c.Region 
FROM Country c 
JOIN CountryLanguage cl 
ON cl.CountryCode = c.Code WHERE cl.Language = 'Spanish';

-- 31)
SELECT c.Name AS Pais, ci.Name AS Capital 
FROM Country c 
JOIN City ci 
ON ci.ID = c.Capital 
WHERE ci.Population > (c.Population / 2);

-- 32)
SELECT c.Name, c.SurfaceArea 
FROM Country c 
JOIN City ci 
ON ci.ID = c.Capital 
WHERE c.Continent = 'Africa' AND ci.Name = ci.District;

-- 33)
SELECT Name, Capital, IndepYear 
FROM Country 
WHERE IndepYear IS NOT NULL 
ORDER BY IndepYear ASC LIMIT 20;

-- 34)
SELECT ci.Name AS Ciudad, cl.Language 
FROM City ci 
JOIN CountryLanguage cl 
ON cl.CountryCode = ci.CountryCode 
WHERE cl.IsOfficial = 'T' AND cl.Language NOT IN ('Spanish','English','Portuguese','Italian','French','German');

-- 35)
SELECT ci.Name, ci.Population, c.Name AS Pais 
FROM City ci 
JOIN Country c 
ON c.Code = ci.CountryCode 
JOIN CountryLanguage cl 
ON cl.CountryCode = c.Code 
WHERE c.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'T' ORDER BY ci.Population DESC LIMIT 10;

-- 36)
SELECT SUM(Population) 
AS TotalPoblacion, 
MAX(Population) AS MaxPoblacion, 
MIN(Population) AS MinPoblacion, 
AVG(Population) AS PromedioPoblacion, 
COUNT(Population) AS Registros 
FROM Country;

-- 37)
SELECT Continent, SUM(Population) AS TotalPoblacion, MAX(Population) AS MaxPoblacion, MIN(Population) AS MinPoblacion, AVG(Population) AS PromedioPoblacion FROM Country GROUP BY Continent;

-- 38)
SELECT Continent, COUNT(*) AS CantidadPaises FROM Country GROUP BY Continent;

-- 39)
SELECT CountryCode, SUM(Population) AS PoblacionTotal FROM City GROUP BY CountryCode;

-- 40)
SELECT Language, MIN(Percentage) AS PorcentajeMinimo FROM CountryLanguage GROUP BY Language;

-- 41)
SELECT GovernmentForm, AVG(Population) AS PromedioPoblacion FROM Country WHERE Continent = 'Europe' GROUP BY GovernmentForm;

-- 42)
SELECT Region, AVG(LifeExpectancy) AS PromedioExpectativa FROM Country GROUP BY Region ORDER BY PromedioExpectativa DESC LIMIT 10;

-- 43)
SELECT District, COUNT(*) AS CantidadCiudades FROM City WHERE Population > (SELECT AVG(Population) FROM City) GROUP BY District ORDER BY CantidadCiudades DESC LIMIT 10;

-- 45)
SELECT Language, COUNT(*) AS CantidadPaises FROM CountryLanguage WHERE IsOfficial = 'T' GROUP BY Language;

-- 46)
SELECT IndepYear, COUNT(*) AS Cantidad FROM Country WHERE IndepYear IS NOT NULL GROUP BY IndepYear HAVING COUNT(*) > 1;

-- 47)
SELECT c.Name, COUNT(cl.Language) AS CantIdiomas FROM Country c JOIN CountryLanguage cl ON cl.CountryCode = c.Code GROUP BY c.Code HAVING COUNT(cl.Language) BETWEEN 3 AND 5;

-- 48)
SELECT ci.District, c.Name AS Pais, SUM(ci.Population) AS PoblacionTotal FROM City ci JOIN Country c ON c.Code = ci.CountryCode GROUP BY ci.District, c.Name HAVING SUM(ci.Population) < 10000;

-- 49)
SELECT Region, AVG(Population / SurfaceArea) AS DensidadPromedio FROM Country GROUP BY Region HAVING DensidadPromedio > (SELECT MAX(Population / SurfaceArea) / 2 FROM Country);

-- 50)
SELECT Language, AVG(Percentage) AS Promedio FROM CountryLanguage WHERE IsOfficial = 'T' GROUP BY Language HAVING AVG(Percentage) < 10;
