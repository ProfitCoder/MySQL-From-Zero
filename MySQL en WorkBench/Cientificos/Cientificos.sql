create database cientificos;

use cientificos;


create table cientifico(
	DNI varchar (10),
    Nombre varchar (20),
    Apellido varchar (20),
    Fecha_nacimiento date,
    primary key (DNI));
    
create table Asignado(
	DNI varchar (10),
    Codigo varchar (10),
    primary key (DNI,Codigo),
    foreign key (DNI) references cientifico (dni),
    foreign key (Codigo) references proyecto (codigo));
    
    drop table Asignado;
    
create table Proyecto(
	Codigo varchar (10),
    Nombre varchar (20),
    Horas int,
    primary key (Codigo));
    

insert into cientifico values (1,'Maria','Guzmán','1974-02-12');
insert into cientifico values (2,'Maria','Jiménez','1954-02-11'),
							  (3,'Rafael','Girado','1964-01-22'),
                              (4,'Alonso','Gómez','1990-12-12'),
                              (5,'Clara','Antúnez','1973-11-12');
                              
insert into Asignado values (1,'A');
insert into Asignado values (1,'B'),
							(1,'C'),
                            (2,'A'),
                            (3,'A'),
                            (2,'B'),
                            (4,'A'),
                            (4,'B'),
                            (4,'C'),
                            (4,'E'),
                            (4,'D');
                            
insert into Proyecto values ('A','Bioquímica',410);
insert into Proyecto values ('B','Electronica',1200),
							('C','Geológica',300),
                            ('D','Tectónica',500),
                            ('E','Histograma',70);
                            
select * from Cientifico;
select * from Asignado;
select * from Proyecto;

-- 1. Relación completa de los científicos asignados a cada proyeto. Mostrar DNI, Nombre del científico, Identificador del proyecto y nombre del proyecto.

SELECT DISTINCT c.dni,c.nombre,p.codigo,p.nombre 
FROM cientifico c
JOIN asignado a ON c.dni = a.dni
JOIN proyecto p ON a.codigo = p.codigo;

-- 2. Obtener el número de proyectos al que está asignado cada científico (Mostrar el DNI y el nombre).
 
SELECT DISTINCT c.dni,c.nombre, count(a.codigo) AS Numero_Proyectos 
FROM cientifico c
LEFT JOIN asignado a ON a.dni = c.dni
GROUP BY c.dni,c.nombre;

-- 3. Obtener el número de científicos asignados a cada proyecto (Mostrar el identificador del proyecto y el nombre del proyecto).
 
SELECT DISTINCT p.codigo,p.nombre,count(a.dni) AS Numero_Cientificos
FROM proyecto p
JOIN asignado a ON p.codigo = a.codigo
GROUP BY p.codigo,p.nombre;

-- 4. Obtener el número de dedicación de cada científico.

SELECT c.dni,c.nombre,SUM(p.horas) AS horas_trabajadas 
FROM cientifico c 
JOIN asignado a ON c.dni = a.dni
JOIN proyecto p ON a.codigo = p.codigo
GROUP BY c.dni,c.nombre;

-- 5. Obtener el DNI y el nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media de cada proyecto sea superior a las 80 horas.

SELECT c.dni,c.nombre
FROM cientifico c
JOIN asignado a ON c.dni = a.dni
JOIN proyecto p ON a.codigo = p.codigo
GROUP BY c.dni,c.nombre
HAVING COUNT(p.codigo) > 1
AND AVG(p.horas) > 80;

-- 6. Nombre del científico que trabaja en todos los proyectos.

SELECT c.nombre
FROM cientifico c
JOIN asignado a ON c.dni = a.dni
GROUP BY c.dni
HAVING COUNT(*) =
(SELECT COUNT(*) FROM proyecto);

-- 7. Nombre del científico que no trabaja en ningún proyecto.

SELECT c.nombre
FROM cientifico c
LEFT JOIN asignado a ON c.dni = a.dni
WHERE a.codigo IS NULL;

-- 8. La media de horas de los proyectos excluyendo el valor mínimo y el valor máximo.

SELECT AVG (p.horas) AS media_horas
FROM proyecto p
WHERE horas NOT IN (
(SELECT MIN(horas) FROM proyecto),
(SELECT MAX(horas) FROM proyecto)
); 

-- 9. Calcular la moda del número de horas (el valor que más se repite).

insert into proyecto values ('F','Biomedicina',300);

SELECT proyecto.horas AS moda
FROM proyecto 
GROUP BY proyecto.horas
ORDER BY COUNT(*) DESC
LIMIT 1;


-- 10. Obtener los científicos que trabajan en proyectos con más de 400 horas.

SELECT DISTINCT c.nombre
FROM cientifico c
JOIN asignado a ON c.dni = a.dni
JOIN proyecto p ON a.codigo = p.codigo
WHERE p.horas > 400;

-- 11. Mostrar los científicos que solo trabajan en proyectos con más de 100 horas

SELECT c.nombre
FROM cientifico c
WHERE NOT EXISTS (
SELECT *
FROM asignado a
JOIN proyecto p ON a.codigo = p.codigo
WHERE c.dni = a.dni
AND p.horas <= 100 
);

-- 12. Listar los proyectos en los que trabaja al menos un científico llamado "María"			no lo soluciono

SELECT p.nombre
FROM proyecto p
JOIN asignado a ON a.codigo = p.codigo
JOIN cientifico c ON c.dni = a.dni
GROUP BY c.nombre
HAVING c.nombre = 'María'; 

-- 13. Obtener el total de horas asignadas a cada científico

select c.nombre,SUM(p.horas) as Horas_trabajadas
from cientifico c
join asignado a on a.dni = c.dni
join proyecto p on a.codigo = p.codigo
group by c.dni,c.nombre;


-- 14. Mostrar los científicos que trabajan en proyectos cuyo nombre empieza por 'B'				

select c.nombre,p.nombre
from cientifico c
join asignado a ON a.dni = c.dni
join proyecto p ON a.codigo = p.codigo
where p.nombre like 'B%';

-- 15. Obtener el proyecto con mayor número de científicos asignados					error

select p.codigo,nombre,count(a.dni)
from proyecto p
join asignado a on p.codigo = a.codigo
group by p.codigo
having count() = ()


-- 16. Mostrar los científicos que trabajan en más proyectos que la media

select c.nombre,c.dni,count(p.codigo) as cantidad
from cientifico c
inner join asignado a on c.dni = a.dni
inner join proyecto p on a.codigo = p.codigo											pendiente
group by c.dni,c.nombre
having cantidad > (select avg(p.codigo) from proyecto);

-- 17. Obtener los proyectos que no tienen ningún científico asignado.

select p.nombre,p.codigo 
from proyecto p
left join asignado a on p.codigo = a.codigo
where a.dni is null;

-- 18. Listar científicos nacidos antes de 1970 que trabajen en proyectos de más de 300 horas.

select c.nombre,c.apellido
from cientifico c
join Asignado a on c.dni = a.dni
join proyecto p on a.codigo = p.codigo
where c.edad > '1970-01-01';

-- 19. Obtener el proyecto con menos horas que tenga científicos asignados.

SELECT nombre
from proyecto
where horas = (select MIN(horas) from proyecto limit 1) and (select distinct codigo from proyecto where Codigo is not null)
;

-- Ejemplos de clase

SELECT p.codigo,p.nombre 
FROM proyecto p
JOIN asignado a ON a.codigo = p.codigo
GROUP BY p.codigo
HAVING count(a.codigo) = 1;

SELECT p.codigo,p.nombre 
FROM proyecto p
JOIN asignado a ON a.codigo = p.codigo
JOIN cientifico c ON a.dni = c.dni
WHERE p.nombre LIKE 'T%' OR p.nombre LIKE 'H%'; 
