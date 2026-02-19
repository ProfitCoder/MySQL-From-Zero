create database gimnasio;

use gimnasio;

show tables;

create table Monitor(
	DNI int,
    Nombre varchar(50),
    telefono int,
    titulacion varchar(20),
    primary key (DNI));
    
create table Socio(
	DNI int,
    Nombre varchar(50),
    direccion varchar(40),
    telefono int,
    Primary key(DNI));
    
create table Aparatos(
	Codigo int,
    descripcion varchar(40),
    Estado varchar(50),
    Primary key(Codigo));
    
create table salas(
	Numero int,
    superficie int,
    ubicacion varchar(50),
    tipo varchar(50),
	Primary key(Numero));
    
create table tienen(
	Numero int,
    codigo int,
    primary key(Numero,codigo),
    foreign key (numero) references salas (numero),
    foreign key (codigo) references aparatos (codigo));

create table clases(
	codigo int,
    descripcion varchar(50),
    dia varchar(20),
    primary key(codigo));

create table se_imparten(
	numero int,
	codigo int,
	primary key(numero,codigo),
	foreign key (numero) references salas(numero),
	foreign key (codigo) references clases(codigo)
);

create table son_impartidas(
	codigo int,
	dni int,
	primary key(codigo,dni),
	foreign key (codigo) references clases(codigo),
	foreign key (dni) references monitor(dni)
);

create table asisten(
	dni int,
	codigo int,
	primary key(dni,codigo),
	foreign key (dni) references socio(dni),
	foreign key (codigo) references clases(codigo)
);



    

-- 1
SELECT nombre,telefono
FROM socio
WHERE direccion='Trinidad';

-- 2
SELECT nombre,telefono
FROM socio
WHERE direccion='Cava';

-- 3
SELECT s.nombre,s.direccion
FROM socio s,asisten a,clases c
WHERE s.dni=a.dni
AND a.codigo=c.codigo
AND c.descripcion='Aerobic';

-- 4
SELECT s.nombre,s.direccion
FROM socio s,asisten a,clases c
WHERE s.dni=a.dni
AND a.codigo=c.codigo
AND c.descripcion='Step';

-- 5
SELECT DISTINCT s.nombre
FROM socio s,asisten a,son_impartidas si,monitor m
WHERE s.dni=a.dni
AND a.codigo=si.codigo
AND si.dni=m.dni
AND m.nombre='Ana Gil';

-- 6
SELECT nombre
FROM monitor
WHERE titulacion='INEF';

-- 7
SELECT descripcion
FROM aparatos
WHERE estado='Nuevo';

-- 8
SELECT s.nombre,s.direccion
FROM socio s,asisten a,clases c
WHERE s.dni=a.dni
AND a.codigo=c.codigo
AND c.dia_hora<'16:00:00';

-- 9
SELECT numero,tipo
FROM salas
WHERE superficie>12;

-- 10
SELECT DISTINCT s.nombre
FROM socio s,asisten a,son_impartidas si,monitor m
WHERE s.dni=a.dni
AND a.codigo=si.codigo
AND si.dni=m.dni
AND m.nombre='Pepe Perez';

-- 11
SELECT DISTINCT s.nombre
FROM socio s,asisten a,se_imparten si,salas sa
WHERE s.dni=a.dni
AND a.codigo=si.codigo
AND si.numero=sa.numero
AND sa.ubicacion='Planta 1';

-- 12
SELECT ap.descripcion
FROM aparatos ap,tienen t,salas s
WHERE ap.codigo=t.codigo
AND t.numero=s.numero
AND s.ubicacion='Planta 1';

-- 13
SELECT c.descripcion,s.nombre
FROM clases c
LEFT JOIN asisten a ON c.codigo=a.codigo
LEFT JOIN socio s ON a.dni=s.dni;

-- 14
SELECT m.nombre,c.descripcion,c.dia_hora
FROM monitor m,son_impartidas si,clases c
WHERE m.dni=si.dni
AND si.codigo=c.codigo;

-- 15
SELECT DISTINCT c.descripcion
FROM clases c,se_imparten si,salas s
WHERE c.codigo=si.codigo
AND si.numero=s.numero
AND s.superficie>22;

-- 16
SELECT sa.numero,ap.descripcion
FROM salas sa
LEFT JOIN tienen t ON sa.numero=t.numero
LEFT JOIN aparatos ap ON t.codigo=ap.codigo;

-- 17
SELECT c.descripcion,COUNT(a.dni) AS inscritos
FROM clases c
LEFT JOIN asisten a ON c.codigo=a.codigo
GROUP BY c.descripcion
ORDER BY inscritos DESC;

-- 18
SELECT tipo,SUM(superficie)
FROM salas
GROUP BY tipo;

-- 19
SELECT m.nombre
FROM monitor m
LEFT JOIN son_impartidas si ON m.dni=si.dni
WHERE si.dni IS NULL;

-- 20
SELECT *
FROM salas
WHERE superficie>(SELECT AVG(superficie) FROM salas);

-- 21
SELECT s.nombre,c.descripcion
FROM socio s,asisten a,clases c,se_imparten si,salas sa
WHERE s.dni=a.dni
AND a.codigo=c.codigo
AND c.codigo=si.codigo
AND si.numero=sa.numero
AND sa.ubicacion='Planta 1';

-- 22
SELECT c.descripcion
FROM clases c,asisten a
WHERE c.codigo=a.codigo
GROUP BY c.descripcion
HAVING COUNT(a.dni)>2;

-- 23
SELECT ap.descripcion,t.numero
FROM aparatos ap,tienen t
WHERE ap.codigo=t.codigo
AND ap.estado='Malo';

-- 24
SELECT DISTINCT s.nombre
FROM socio s,asisten a,son_impartidas si,monitor m
WHERE s.dni=a.dni
AND a.codigo=si.codigo
AND si.dni=m.dni
AND m.titulacion='INEF';

-- 25
SELECT AVG(superficie)
FROM salas
WHERE tipo='Cardio';
  