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



-- Dia 02-12-2025

create table departamento(
	nombre varchar(30),
    asignacion int,
    primary key (nombre));
    
create table emplea2(
	DNI int,
    Nombre varchar(30),
    fecha_nac date,
    nombre_departamento varchar(30),
    primary key (DNI),
    foreign key(nombre_departamento) references departamento(nombre));
    
insert into departamento values ('Ventas',1000000);
insert into departamento values('Marketing',5000);
insert into departamento values('Recursos Humanos',30000);

-- Esta instrucción daria un error si antes no se ha insertado en departamento el departamento, ya que como es normal, si no existe el departamento no puede obtener valores 
insert into emplea2 values(1,'pepe','2002-12-12','Ventas');
insert into emplea2 values(2,'Ana','2004-12-12','Marketing');
insert into emplea2 values(3,'Juan','1999-12-02','Recursos Humanos');
insert into emplea2 values(5,'Eva','1960-05-24','Recursos Humanos');
insert into emplea2 values(4,'Jose','1998-10-12','Ventas');

select * from departamento d, emplea2		-- Al poner departamento d estoy haciendo que la de sea una constante donde se guarda la info, asi que despues con poner la d vale.
where d.nombre=nombre_departamento;

-- Nombre y DNI de los empleados de los departamentos cuya asignación es inferior a 500000
Select emplea2.nombre,DNI 
from emplea2,departamento 
where asignacion <= 500000 and departamento.nombre=nombre_departamento;

-- Nombre del departamento/os en los que algun empleado haya nacido antes del año 2000.
select d.nombre from departamento d, emplea2 e where e.fecha_nac <'2000-01-01' and d.nombre=nombre_departamento;

set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Nombre de los departamentos y número de empleados
select departamento.nombre, count(*) as emplea2
from departamento, emplea2
where emplea2.nombre_departamento = departamento.nombre
group by departamento.nombre;

-- Nombre de los departamentos que tienen menos de 2 empleados 
select departamento.nombre, count(*) as emplea2
from departamento, emplea2
where emplea2.nombre_departamento = departamento.nombre
group by departamento.nombre;