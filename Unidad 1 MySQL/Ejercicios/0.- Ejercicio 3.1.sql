-- A)

create database Ejercicio31;
use Ejercicio31;

create table agenda(
	nombre varchar(20),
    domicilio varchar(30),
    telefono varchar(11),
    Primary key(nombre)
);

-- Si se intenta crear no deja porque ya existe, ERROR CODE: 1050

show tables;

describe agenda;

-- La borramos
drop table agenda;

-- B)

create table libros(
	titulo varchar(20),
    autor varchar(30),
    editorial varchar(15),
    Primary Key (titulo)
);

show tables;

describe table libros;

drop table libros;
