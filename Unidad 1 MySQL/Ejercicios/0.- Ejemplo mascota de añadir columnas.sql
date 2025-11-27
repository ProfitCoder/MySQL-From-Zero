create database Mascota;
use mascota;

create table if not exists Mascota(
	Nombre varchar(30),
    especie varchar(30),
    sexo char(1),
    fecha_nac date
);

drop table macota;

-- Para añadir una columna nueva como una Primary Key hacemos 
Alter table mascota add column id int;

-- Este comando nos permite hacer una primary key desde fuera sin tocar la tabla 
alter table mascota add constraint primary key(id);

describe mascota;


-- Añadirle a la tabla mascota una restriccion "check" de manera que en sexo solo podamos meter una f o una m. 