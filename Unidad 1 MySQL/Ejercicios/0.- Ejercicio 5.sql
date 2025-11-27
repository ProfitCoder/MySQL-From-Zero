create database Ejercicio5;
use Ejercicio5;


-- A)

create table peliculas(
	nombre varchar(20),
    actor varchar(20),
    duracion float,
    cantidad integer,
    Primary key(nombre)
);

describe peliculas;

insert into peliculas (nombre,actor,duracion,cantidad) values ('Mision imposible','Tom Cruise   ',120,3);
insert into peliculas (nombre,actor,duracion,cantidad) values ('Mision imposible 2','Tom Cruise ',180,2);
insert into peliculas (nombre,actor,duracion,cantidad) values ('Mujer Bonita','Julia R.','90','30');
insert into peliculas (nombre,actor,duracion,cantidad) values ('Elsa Fred','China Zorrilla','90','2');

delete from peliculas where actor='Tom Cruise';

select * from peliculas;

-- B)

create table empleados(
	nombre varchar(20),
    documento varchar(8)
);



