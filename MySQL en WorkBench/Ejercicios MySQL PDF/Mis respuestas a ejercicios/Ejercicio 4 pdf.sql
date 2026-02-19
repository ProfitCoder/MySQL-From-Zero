create database Ejercicio4;
use Ejercicio4;

create table empleados(
	DNI varchar(8),
    Nombre varchar(100),
    Apellidos varchar(255),
    Departamento int,
    Primary key(DNI));
    
create table Departamentos(
	Codigo int,
    Nombre varchar(100),
    Presupuesto int,
    Primary key (Codigo));
    
insert into Departamentos values
(14,'Marketing',20000),
(37,'Facturación',2000),
(77,'Ventas',22000),
(55,'RR.HH',60000),
(1,'Informática',70000),
(21,'Mantenimiento',80000),
(31,'Exteriores',90000);
    

insert into empleados values
(111, 'Francisco', 'Medina',14),
(112, 'Francisco', 'López',37),
(113, 'Francisco', 'Pérez',77),
(114, 'Cristina', 'Medina',77),
(115, 'Cristina', 'Martín',55),
(116, 'Cristina', 'López',21),
(117, 'Jaime', 'Pérez',21),
(118, 'Marcos', 'García',21);
    
-- 1) Obtener el nombre de los empleados 
select nombre from empleados;

-- 2) Obtener los apellidos de los empleados sin repeticiones
select distinct apellidos from empleados ;

-- 3) Obtener los datos de los que se apellidan lópez
select * from empleados where apellidos = 'López';

-- 4) Obtener datos de los que se apellidan López y los que se apellidan Perez
select * from empleados where apellidos = 'López' or apellidos = 'Pérez';

-- 5) Obtener los datos de los empleados que trabajan en el departamento 14
select * from empleados where departamento = 14;

-- 6) Obtener los datos de los que trabajan para el departamento 37 y para el 77 
select * from empleados where departamento = 37 or departamento = 77;

-- 7) Obtener el nombre de los empleados cuyo apellido empieza por P
select * from empleados where apellidos = 'P%';

-- 8) Obterner presupuesto total de todos los departamentos
select SUM(Presupuesto) from departamentos;

-- 9) Obtener el numero de empleados de cada departamento
select count(*) empleados from empleados as numero_empleados;

-- 10) Obtener listado ordenado con datos y departamento
select * from empleados order by apellidos;

-- 11) Obtener listado completo con nombre y apellidos junto nombre y presupuesto del departamento
select empleados.nombre,apellidos,departamentos.nombre,presupuesto from empleados,departamentos;

-- 12) 
select empleados.nombre, apellidos, departamentos.nombre
from empleados, departamentos
where departamento = codigo and presupuesto >60000;

-- 13)
select round(avg(presupuesto),2)
from departamentos;

-- 14)

select departamento,count(*) as numero_empleados
from empleados 
group by departamento;

-- 15)
insert into departamentos values (11,'Calidad',40000);
insert into empleados values ('89267109','Esther','Vázquez',11);

set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 16)
select * from departamentos;
update departamentos set presupuesto=presupuesto-presupuesto*0.1;

-- 17) 

select * from empleados;
update empleados set departamentos=14 where departamento=77;

-- 18) 