create database Ejercicio4;
use ejercicio4;

/*
create table usuarios(
	nombre varchar(30),
    clave varchar(10)
);

insert into usuarios(nombre,clave) values ('Pablo',12345);

select nombre,clave from usuarios;
*/
drop table usuarios;


-- A)

create table agenda(
	nombre varchar (30),
    domicilio varchar (30),
    telefono varchar (11),
    primary key(nombre)
);

show tables;
describe table agenda;

insert into agenda (nombre,domicilio,telefono) values ('Alberto Mores','Colon123','4355223');
insert into agenda (nombre,domicilio,telefono) values ('Juan Torres','Avellaneda 135','4458226585');

select nombre,domicilio,telefono from agenda;

drop table agenda;

-- B)

create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15),
    primary key(titulo)
);

show tables;

insert into libros (titulo,autor,editorial) values ('El aleph','Borgues','Planeta');
insert into libros (titulo,autor,editorial) values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial) values ('Aprenda PHP','Mario Molina','Emece');

select titulo,autor,editorial from libros;