-- Esto es un comentario de una linea
# Esto es otro comentario de una linea
/* Esto 
es 
comentario multilinea*/

-- Para enseñar las base de datos creadas
show databases;

-- Para crear la base de datos Prueba
create database prueba;

-- Para usar la base de datos Prueba 
use prueba;

-- Para crear la tabla "cliente"
CREATE TABLE cliente (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(25),
    Apellidos VARCHAR(30)
);

-- Para enseñar las tablas que hay activas
show tables;

-- Para eliminar la tabla creada
drop table cliente;

-- Para darle valores a la tabla cliente,
insert into cliente(DNI, Nombre, Apellidos) values ('123A','Ana','Lopez');
insert into cliente(DNI, Nombre) values ('456B','Pepe');

-- Para que muestre las filas.
select DNI,Nombre,Apellidos from cliente;

-- Para que enseñe el contenido de la tabla cliente
describe cliente;

-- Para crear otra Tabla
create table emp_project (
SSN int,
id_project int,
hours int,
Primary key (SSN, id_project));
