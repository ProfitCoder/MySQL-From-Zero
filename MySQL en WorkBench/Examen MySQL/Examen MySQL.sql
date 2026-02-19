create database Examen;

use Examen;

create table Proveedor(
	pr varchar(2),
    nombre varchar(50),
    estado int,
    ciudad varchar(50),
    Primary key (pr));

create table Pieza(
	pz varchar(2),
    nombre varchar(50),
    color varchar(20),
    peso int,
    ciudad varchar(20),
    Primary key (pz));
    
create table Suministro(
	pr varchar(2),
    pz varchar(2),
    cantidad int,
    Primary key (pr,pz),
    foreign key (pr) references Proveedor (pr),
    foreign key (pz) references Pieza (pz));
    
describe Proveedor;
describe Pieza;
describe Suministro;

insert into Proveedor values ('S1','Salazar',20,'Londres');
insert into Proveedor values ('S2','Jaime',10,'Paris'),
							 ('S3','Bernal',30,'Paris'),
                             ('S4','Corona',20,'Londres'),
                             ('S5','Aldana',30,'Atenas');
                             
insert into Pieza values ('P1','tuerca','verde',12,'Paris');
insert into Pieza values ('P2','perno','rojo',17,'Londres'),
						 ('P3','birlo','azul',17,'Roma'),
                         ('P4','birlo','rojo',14,'Londres'),
                         ('P5','birlo','azul',12,'Paris'),
                         ('P6','engrane','rojo',19,'Paris');

insert into suministro values ('S1','P1',300);
insert into suministro values ('S1','P3',400),
							  ('S1','P4',200),
                              ('S1','P5',100),
                              ('S2','P1',300),
                              ('S2','P2',400),
                              ('S3','P2',200),
                              ('S4','P2',200),
                              ('S4','P4',300),
                              ('S4','P5',400);
                              
-- 1. Obtener todas las piezas (nombre,color y peso) de color verde y rojo.alter

SELECT nombre,color,peso
FROM pieza
WHERE color = 'verde' OR color = 'rojo';

-- 2. Obtener nombre,estado y ciudad de los proveedores que están en las ciudades que empiezan por L.

SELECT nombre,estado,ciudad
FROM proveedor
WHERE ciudad like 'L%';

-- 3. Obtener un listado completo de los suministro indicando el nombre del suministrador,el estado, el nombre de la pieza y el color de la misma.

SELECT pr.nombre,pr.estado,pi.nombre,pi.color
FROM proveedor pr
JOIN suministro s ON pr.pr=s.pr
JOIN Pieza pi ON s.pz = pi.pz;

-- 4. Obtener el nombre de las piezas cuyo peso es superior al peso medio de todas las piezas.alter

SELECT nombre
FROM pieza 
WHERE peso > (SELECT AVG(peso) FROM pieza);

-- 5. Obtener el nombre de los proveedores que no realizan suministros.

SELECT pr.nombre
FROM proveedor pr
LEFT JOIN suministro s ON pr.pr = s.pr
WHERE s.pz IS NULL;

-- 6. El nombre y ciudad de los proveedores que realizan suministros.

SELECT pr.nombre,pr.ciudad
FROM proveedor pr
JOIN suministro s ON pr.pr = s.pr
GROUP BY s.pr
HAVING COUNT(s.pz) > 2;

-- 7. Mostrar las piezas que son suministradas por más de dos sumisnistros.

SELECT pi.pz, pi.nombre, COUNT(*) AS total
FROM Pieza pi
JOIN suministro s ON pi.pz = s.pz
GROUP BY pi.pz, pi.nombre
HAVING COUNT(*) > 1;

-- 8. 
SELECT p.nombre,s.cantidad 
FROM proveedor p
JOIN suministro s ON p.pr=s.pr
WHERE p.estado = 30;

-- 9.
SELECT DISTINCT pr.nombre
FROM proveedor pr
JOIN suministro s ON pr.pr = s.pr
JOIN Pieza pz ON s.pz = pz.pz
WHERE pr.ciudad = pz.ciudad;

-- 10.
SELECT pr.pr,pr.nombre, SUM(s.cantidad) AS total_suministrado
FROM proveedor pr 
JOIN suministro s ON pr.pr = s.pr
GROUP BY pr.pr,pr.nombre;

-- 11. Listar los proveedores que están en París.

SELECT * 
FROM proveedor 
WHERE ciudad = 'Paris';

-- 12.

SELECT *
FROM Pieza
WHERE color='rojo';

-- 13.

Select *
From suministro
where pr = 'S1';

-- 14.

Select distinct p.nombre,SUM(s.cantidad) as Total_suministra
FROM proveedor p
JOIN suministro s ON p.pr = s.pr
GROUP BY p.nombre;

-- 15.

SELECT p.nombre,pieza.nombre,s.cantidad
FROM proveedor p
JOIN suministro s ON s.pr = p.pr
JOIn pieza ON pieza.pz = s.pz;

-- 16.

SELECT DISTINCT pr.nombre
FROM proveedor pr
JOIN suministro s ON pr.pr = s.pr
JOIN pieza pi ON pi.pz = s.pz
WHERE pr.ciudad = pi.ciudad;

-- 17.

SELECT pr.nombre,COUNT(s.pz) AS Total_Piezas
FROM proveedor pr
JOIN suministro s
ON pr.pr = s.pr
JOIN pieza pz ON pz.pz = s.pz
GROUP BY pr.nombre;

-- 18.

SELECT p.nombre
FROM proveedor p
JOIN suministro s ON p.pr = s.pr
GROUP BY p.nombre 
HAVING COUNT(Distinct s.pz) > 1;  

