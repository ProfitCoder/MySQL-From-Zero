create database Ej_1;
use Ej_1;

create table mascotas(
	nombre varchar(20),
    propietario varchar(20),
    especie varchar(20),
    sexo char(1),
    nacimiento date,
    fallecimiento date
);

insert into mascotas (nombre,propietario,especie,sexo,nacimiento,fallecimiento) value ('Fluffi','Arnoldo','Gato','f','1999-02-04',NULL);
insert into mascotas (nombre,propietario,especie,sexo,nacimiento,fallecimiento) value ('Mau','Juan','Gato','m','1998-03-17',NULL),
																					  ('Buffi','Arnoldo','Perro','f','1999-05-13',NULL),
                                                                                      ('FanFan','Benito','Perro','m','2000-08-27',NULL),
                                                                                      ('Kaiser','Diana','Perro','m','1997-07-29','1998-08-31'),
                                                                                      ('Chispa','Omar','Ave','f','1998-09-11',NULL),
                                                                                      ('Wicho','Tomás','Ave',NULL,'2000-02-09',NULL),
                                                                                      ('Skim','Benito','Serpiente','m','2001-04-29',NULL);

-- Apartado 1:

UPDATE mascotas set nacimiento='1989-08-31' where nombre='Kaiser';

-- Para quitar el modo seguro
SET SQL_SAFE_UPDATES = 0;

select * from mascotas;

-- 1) Que muestre aquellos que nacieron despues de los 2000
select * from mascotas where nacimiento > '2000-01-01';

-- 2) Conocer nombres y propietarios de 'f'
select * from mascotas where especie = 'Perro' and sexo = 'f';

-- 3) Conocer nombres de propietarios de perras y gatas 
select * from mascotas where (especie = 'Perro' or especie = 'Gato') and sexo = 'f';

-- 4) Conocer fecha de nacimiento de las mascotas
select nombre,nacimiento from mascotas;

-- 5) Conocer quien tiene una mascota
select propietario from mascotas; 

select nombre 
from mascotas 
order by nacimiento;

select count(*) as numeromascotasfemeninas from mascotas where sexo='f';

select propietario, count(*) from mascotas where propietario='Arnoldo';

-- 11) Nombre de las mascotas que empiezan por B
select nombre,especie,nacimiento
from mascotas
order by especie ASC,nacimiento DESC;

-- 12) Nombre del mascotas cuyo cumpleaños es el proximo mes


-- 13) Nombre de las mascotas que empiezan por B
select nombre from mascotas where nombre like 'B%';

-- 14) Nombre de las mascotas que terminan por fy
select nombre from mascotas where nombre like '%fy';

-- 15) Deseamos conocer cuántas mascotas tiene cada uno de los propietarios
select propietario, count(*) as cantidad_mascotas from mascotas group by propietario;

-- 16)
select especie,count(*) as numero_animales from mascotas group by especie;

-- 17)
select especie,count(*) as numero_animales from mascotas group by sexo;

-- 18)
select especie,count(*) as numero_animales from mascotas group by sexo,especie;
