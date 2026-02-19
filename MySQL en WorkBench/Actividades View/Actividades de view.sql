create database ActividadView;

use ActividadView;

-- 1. Elimine las tablas y créelas nuevamente:

drop table if exists inscritos;
drop table if exists socios;
drop table if exists profesores;
drop table if exists cursos;

create table socios(
	documento varchar(8) not null,
    nombre varchar(40),
    domicilio varchar(30),
    primary key (documento));

create table profesores(
	documento varchar(8) not null,
    nombre varchar(40),
    domicilio varchar(30),
    primary key(documento));
 
create table cursos(
	numero integer auto_increment,
    deporte varchar(20),
    dia varchar(15),
    documentoprofesor char(8),
    primary key (numero));
    
create table inscritos(
	documentosocio char(8) not null,
	numero integer not null,
	matricula char(1),
	primary key (documentosocio,numero));

-- 2. Ingrese algunos registros para todas las tablas:

insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos(deporte,dia,documentoprofesor)
values('tenis','lunes','22222222');

insert into cursos(deporte,dia,documentoprofesor)
values('tenis','martes','22222222');

insert into cursos(deporte,dia,documentoprofesor)
values('natacion','miercoles','22222222');

insert into cursos(deporte,dia,documentoprofesor)
values('natacion','jueves','23333333');

insert into cursos(deporte,dia,documentoprofesor)
values('natacion','viernes','23333333');

insert into cursos(deporte,dia,documentoprofesor)
values('futbol','sabado','24444444');

insert into cursos(deporte,dia,documentoprofesor)
values('futbol','lunes','24444444');

insert into cursos(deporte,dia,documentoprofesor)
values('basquet','martes','24444444');

insert into inscritos values('30000000',1,'s');
insert into inscritos values('30000000',3,'n');
insert into inscritos values('30000000',6,null);
insert into inscritos values('31111111',1,'s');
insert into inscritos values('31111111',4,'s');
insert into inscritos values('32222222',8,'s');

select * from socios;
select * from profesores;
select * from cursos;
select * from inscritos;

-- 3. Elimine la vista "vista_club" si existe:
 
drop view vista_club;

-- 4. Cree 	

CREATE VIEW vista_club AS
SELECT s.nombre AS nombre_socio,s.documento,p.nombre AS nombre_profe,c.dia,c.deporte
FROM socios s
JOIN inscritos i ON s.documento = i.documentosocio
JOIN cursos c ON i.numero = c.numero
JOIN profesores p ON c.documentoprofesor = p.documento;

select * from vista_club; 

-- 6. Realice una consulta a la vista donde muestre la cantidad de socios inscritos en cada deporte ordenados por cantidad.

select COUNT(documento) AS Cantidad_Socios,deporte
from vista_club
group by deporte
order by Cantidad_socios desc;

-- 7. Muestre (consultado la vista) el nombre y documento de los socios que deben matrículas.

-- 8. 




