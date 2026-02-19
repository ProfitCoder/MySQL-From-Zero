create database Examen_recu;

use Examen_recu;

create table empleado(
	EMP varchar(5),
    DNI int,
    Nombre varchar(20),
    numhijos int,
    ciudad varchar(50),
    primary key(EMP)
);

create table departamento(
	DPTO varchar(5),
    nombre varchar(50),
    asignacion int,
    primary key(DPTO)
);

create table pertenece(
	EMP varchar(5),
    DPTO varchar(5),
    foreign key (EMP) references empleado(EMP),
    foreign key (DPTO) references departamento(DPTO)
);

create table articulos(
	ART varchar(5),
    nombre varchar(50),
    color varchar(20),
    CTD int,
    Iva int,
    primary key (ART)
);

create table USA(
	DPTO varchar(5),
    ART varchar(5),
    foreign key (DPTO) references departamento(DPTO),
    foreign key (ART) references articulos(ART)
);

insert into empleado values ('E1',801,'Uno',1,'Albacete');
insert into empleado values ('E2',802,'Dos',2,'Cuenca'),
							('E3',803,'Tres',3,'Albacete'),
                            ('E4',804,'Cuatro',4,'Lisboa');

insert into departamento values ('D1','Marketing',115.000);
insert into departamento values ('D2','Facturación',75.000),
								('D3','Ventas',65.000),
                                ('D4','Recursos Humanos',60.000);

insert into pertenece values ('E1','D1');
insert into pertenece values ('E2','D1'),
							 ('E3','D3'),
							 ('E4','D2');

insert into articulos values ('A1','Impresoras','Verde',150,12);
insert into articulos values ('A2','Tinta','Azul',380,6),
							 ('A3','Papel','Azul',600,6),
                             ('A4','Boligrafos','Blanco',1000,12),
                             ('A5','Lápiz','Negro',500,12),
                             ('A6','Proyector','Negro',550,12),
                             ('A7','Portátil','Amarillo',350,6),
                             ('A8','Pantalla','Rojo',375,12);

insert into usa values ('D1','A1');
insert into usa values ('D1','A2'),
					   ('D2','A2'),
                       ('D3','A2'),
                       ('D3','A3'),
                       ('D3','A4'),
                       ('D3','A1'),
                       ('D2','A3'),
                       ('D1','A5'),
                       ('D1','A6'),
                       ('D2','A7'),
                       ('D3','A7'),
                       ('D2','A7');

-- 1. Obtener el nombre y ciudad de los empleados con más de 2 hijos.

select nombre,ciudad
from empleado
where numhijos > 2;

-- 2. Nombre y ciudad de los empleados de Marketing.

select e.nombre,e.ciudad
from empleado e
join pertenece p on e.emp = p.emp
join departamento d on d.DPTO = p.DPTO
where d.nombre = 'Marketing';

-- 3. Nombre de los artículos que tienen un IVA de un 12%.

select nombre
from articulos
where IVA = 12;

-- 4. El número de departamentos que usan impresoras.

select d.dpto
from departamento d
join usa u on d.DPTO = u.DPTO
join articulos a on a.ART = u.ART
where a.nombre = 'Impresoras';

-- 5. Nombre del departamento que tiene la mejor asignación.

select nombre
from departamento 
where asignacion = (select MAX(asignacion) from departamento);

-- 6. El nombre de los acticulos cuyo CTD es mayor que la media de los CTD.

select nombre
from Articulos
where CTD > (select avg(CTD) from articulos);

-- 7. Nombre departamentos y el número de piezas que usan.

select distinct d.nombre,a.art
from departamento d
join usa u on d.DPTO = u.DPTO
join articulos a on u.ART = a.Art
group by d.nombre,a.art;

-- 8. 



-- 9.



-- 10.



