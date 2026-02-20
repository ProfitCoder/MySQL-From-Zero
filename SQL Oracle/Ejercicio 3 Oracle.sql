CREATE TABLE Empleado(
    NumEmpl int,
    NombreEmpl varchar2(50),
    Empleo varchar2(50),
    Jefe int,
    FechaEntr date,
    sueldo int,
    complemento int,
    NumDep int,
    Primary key (NumEmpl),
    foreign key (NumDep) references Departamento(NumDep));

DROP TABLE Empleado;

CREATE TABLE Departamento(
    NumDep int,
    NombreDep varchar2(50),
    Ciudad varchar2(50),
    Primary key (Numdep));

---------------------------
-- Inserts
---------------------------

INSERT INTO Departamento VALUES (10,'Contabilidad','New York');
INSERT INTO Departamento VALUES (20,'Investigación','Dallas');
INSERT INTO Departamento VALUES (30,'Ventas','Chicago');
INSERT INTO Departamento VALUES (40,'Operaciones','Boston');

INSERT INTO Empleado VALUES (7369,'Smith','Ordenanza',7902,TO_DATE('17-12-1980','DD-MM-YYYY'),800,0,20);
INSERT INTO Empleado VALUES (7499,'Allen','Vendedor',7698,TO_DATE('20-02-1981','DD-MM-YYYY'),1600,300,30);
INSERT INTO Empleado VALUES (7521,'Ward','Vendedor',7698,TO_DATE('22-02-1981','DD-MM-YYYY'),1250,500,30);
INSERT INTO Empleado VALUES (7566,'Jones','Directivo',7839,TO_DATE('02-04-1981','DD-MM-YYYY'),2975,0,20);
INSERT INTO Empleado VALUES (7654,'Martin','Vendedor',7698,TO_DATE('28-09-1981','DD-MM-YYYY'),1250,1400,30);
INSERT INTO Empleado VALUES (7698,'Blake','Directivo',7839,TO_DATE('01-05-1981','DD-MM-YYYY'),2850,0,30);
INSERT INTO Empleado VALUES (7782,'Clark','Directivo',7839,TO_DATE('09-06-1981','DD-MM-YYYY'),2450,0,10);
INSERT INTO Empleado VALUES (7788,'Scott','Analista',7566,TO_DATE('09-12-1982','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO Empleado VALUES (7839,'King','Director',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'),5000,NULL,10);
INSERT INTO Empleado VALUES (7844,'Turner','Vendedor',7698,TO_DATE('08-09-1981','DD-MM-YYYY'),1500,0,30);
INSERT INTO Empleado VALUES (7876,'Adams','Ordenanza',7788,TO_DATE('12-01-1983','DD-MM-YYYY'),1100,NULL,20);
INSERT INTO Empleado VALUES (7900,'James','Ordenanza',7698,TO_DATE('03-12-1981','DD-MM-YYYY'),950,NULL,30);
INSERT INTO Empleado VALUES (7902,'Ford','Analista',7566,TO_DATE('03-12-1981','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO Empleado VALUES (7934,'Miller','Ordenanza',7782,TO_DATE('23-01-1982','DD-MM-YYYY'),1300,NULL,10);

---------------------------
-- Selects para comprobar
---------------------------

SELECT * 
FROM Empleado;

SELECT *
FROM Departamento;

--------------
-- EJERCICIOS
--------------

-- 1. Creacion de tablas inserts etc...

-- 2. Creacion de tabla proyecto

CREATE TABLE Proyecto(
    NumProy number(3) NOT NULL,
    NomProy Char(5),
    Presupuesto Number(7,2));

ALTER TABLE Proyecto ADD CONSTRAINT Pk_Proyecto Primary key (NumProy);

INSERT INTO Proyecto VALUES (1,'Alfa',96000);
INSERT INTO Proyecto VALUES (2,'Beta',82000);
INSERT INTO Proyecto VALUES (3,'Gamma',15000);

SELECT *
FROM Proyecto;

-- 3. Ahora vamos a añadir la columna del número del proyecto a la tabla de empleados (con el comando ALTER TABLE).

ALTER TABLE Empleado ADD NumProy int;
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado FOREIGN KEY (numProy) REFERENCES Proyecto(NumProy);

-- 4. A continuación incluimos en el proyecto ALFA a los empleados del departamento número 30 y a los que trabajan de vendedores

UPDATE Empleado
SET NumProy = 1
WHERE NumDep = 30 AND Empleo = 'Vendedor';

SELECT *
FROM Empleado;

-- 5. Al resto de los empleados los incluimos en el proyecto BETA.

UPDATE Empleado
SET NumProy = 2
WHERE Empleo != 'Vendedor';

SELECT *
FROM Empleado;

-- 6. Para obtener una lista alfabética de los empleados junto el nombre del proyecto en el que trabajan.

SELECT e.NombreEmpl,p.NomProy
FROM Empleado e
JOIN Proyecto p ON p.NumProy = e.NumProy
ORDER BY e.NombreEmpl;

-- 7. Selecciona los nombres de los empleados que trabajan en el departamento número 30.

SELECT NombreEmpl
FROM Empleado
WHERE NumDep = 30;

-- 8. Seleccionar los directores de la empresa que ganan más de 2800, indicando también su sueldo.

SELECT NombreEmpl,Sueldo
FROM Empleado
WHERE Sueldo >= 2800 and empleo = 'Director';

-- 9. Seleccionar nombre y sueldo de los empleados que son directores o que ganan más de 2800.

SELECT NombreEmpl,Sueldo
FROM Empleado
WHERE Sueldo >= 2800 OR empleo = 'Director';

-- 10. Seleccionar los nombres de los directores que no trabajen en el departamento número 30, junto con el número de departamento en el que trabajan.

SELECT NombreEmpl,NumDep
FROM Empleado
WHERE NumDep != 30;

-- 11. Seleccionar los nombres de los empleados que tienen un sueldo comprendido entre 1200 y 1400.

SELECT NombreEmpl
FROM Empleado
WHERE sueldo > 1200 AND sueldo < 1400;

-- 12. Seleccionar una lista de los departamentos cuyo número sea 10 o 30.

