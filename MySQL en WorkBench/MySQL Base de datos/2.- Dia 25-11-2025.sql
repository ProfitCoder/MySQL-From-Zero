create database Tabladia25nov;
use tabladia25nov;

create  table mascota(
	nombre varchar(20),
    Tipo varchar(20),
    sexo char(1),
    fecha_nac date,
    id varchar(20),
    primary key (id)
);

alter table mascota add constraint check (sexo in ('f','m'));

insert into mascota (nombre,tipo,sexo,fecha_nac,id) values ('Tango','Perro','f',"2025-06-06",'1');
insert into mascota (nombre,tipo,sexo,fecha_nac,id) values ('Juana','Gato','f',"2003-07-04",'2');
insert into mascota (nombre,tipo,sexo,fecha_nac,id) values ('Marques','Periquito','m',"1999-05-19",'3');
insert into mascota (nombre,tipo,sexo,fecha_nac,id) values ('Coco','Tigre','m',"2024-11-24",'4');

select * from mascota;

select * where tipo='Perro' or sexo='m';

-- Esto es para decir que nos enseñe las mascotas cuyo nombre termine en 'o'
select * from mascota where nombre like '%o';

-- Si fuera para que filtre por primera y ultima letra se pondria:

select * from mascota where nombre like 'c%o';

create table Cliente(
	id int unsigned auto_increment,
    nombre varchar(20),
    edad int,
    peso int,
    sexo char(1),
    primary key (id)
);


-- Si hemos metido un dato erroneo para eliminarlo/editarlo hacemos lo siguiente:
UPDATE cliente  set nombre='Laura' where id = '4';
delete from cliente where id = 10;


alter table cliente add constraint check (sexo in('f','m'));
insert into cliente (nombre,edad,peso,sexo) value ('Pablo',20,72,'m'), ('Juanjo',50,95,'m'), ('Ana',5,29,'f'), ('Juana',50,64,'f'), ('Fran',18,64,'m');	
insert into cliente (nombre,edad,peso,sexo) value ('Ana',46,57,'f');

select * from cliente;

-- Selecciona a aquellos que sean de sexo 'f' y ademas mayores de 50 años  
select nombre,edad from cliente where sexo='f' and edad > 50;

-- 
select nombre,edad,peso from cliente where sexo = 'm' and edad < 50 and peso < 60;