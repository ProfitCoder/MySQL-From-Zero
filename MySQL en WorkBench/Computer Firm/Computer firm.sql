Create database Computerfirm;

use Computerfirm;

create table product(
	maker varchar (10),
    model varchar (50),
    type varchar (50),
    primary key (model));

create table laptop(
	code int,
    model varchar (50),
    speed smallint,
    ram smallint,
    hd real,
    price int,
    screen tinyint,
    primary key (code));
    
create table pc(
	code int,
    model varchar (50),
    speed smallint,
    ram smallint,
    hd real,
    price int,
    cd varchar (10),
    primary key (code));
    
create table printer(
	code int,
    model varchar (50),
    color varchar (1),
    type varchar (10),
    price int,
    primary key (code));
    
insert into printer values
(1,'1276','n','laser',400),
(2,'1433','y','jet',270),
(3,'1434','y','jet',290),
(4,'1401','n','matrix',150),
(5,'1408','n','matrix',270),
(6,'1288','n','laser',400);

insert into product values
('A','1232','PC'),
('A','1233','PC'),
('A','1276','Printer'),
('A','1298','Laptop'),
('A','1401','Printer'),
('A','1408','Printer'),
('A','1752','Laptop'),
('B','1121','PC'),
('B','1750','Laptop'),
('C','1321','Laptop'),
('D','1288','Printer'),
('D','1433','Printer'),
('E','1260','PC'),
('E','1434','Printer'),
('E','2112','PC'),
('E','2113','PC');

insert into pc values
(1,'1232',500,64,5.0,600,'12x'),
(10,'1260',500,32,10.0,350,'12x'),
(11,'1233',900,128,40.0,980,'40x'),
(12,'1233',800,128,20.0,970,'50x'),
(2,'1121',750,128,14.0,850,'40x'),
(3,'1233',800,64,5.0,600,'12x'),
(4,'1121',600,128,14.0,850,'40x'),
(5,'1121',600,128,8.0,850,'40x'),
(6,'1233',750,128,20.0,950,'50x'),
(7,'1232',500,32,10.0,400,'12x'),
(8,'1232',450,64,8.0,350,'24x'),
(9,'1232',450,32,10.0,350,'24x');

insert into laptop values
(1,'1298',350,32,4.0,700,11),
(2,'1321',500,64,8.0,970,12),
(3,'1750',750,128,12.0,1200,14),
(4,'1298',600,64,10.0,1050,15),
(5,'1752',750,128,10.0,1150,14),
(6,'1298',450,64,10.0,950,12)
;

show tables;

-- 1
select model,speed,hd 
from pc 
where price < 500;

-- 2
select maker,printer.model 
from product,printer;

-- 3
select model,ram,screen 
from laptop 
where price > 1000;

-- 4
select model,speed,hd 
from pc 
where cd = '12x' and price <= 600 or cd = '24x' and price <= 600;

-- 5
select maker,speed 
from laptop,product 
where product.model = laptop.model and hd >= 10;

-- 6
select p.model,pc.price 
from product p 
join laptop on p.model = pc.model 
where maker = 'B' 
union
select p.model,pc.price 
from product p 
join pc on p.model = pc.model 
where maker = 'B'
union
select p.model,pc.price 
from product p 
join printer on p.model = pc.model 
where maker = 'B';

-- 7
select distinct maker 
from product 
where type = 'pc' and maker not in (select maker from product where type = 'laptop');

-- 8
select model,price 
from printer 
order by price desc limit 3; 

-- 9
select AVG (price) from pc;

-- 10
select distinct maker 
from product 
where model in (select model from pc); 

-- 11
select round(AVG (pc.speed),2) as Avarage_Speed
from pc 
join product p
on pc.model = p.model
where p.maker = 'A'; 

-- 12
select distinct type,l.model,l.speed 
from laptop l join product 
where type = 'Laptop' and l.speed < (select min(speed) from pc);

-- 13
select distinct maker,price 
from product,printer
where printer.color = 'Y' 
order by price asc;

-- 14
select maker, count (pc.model) 
as number_models
from pc;

-- 15
SELECT avg (laptop.price) and avg (pc.price) from pc join laptop where maker = 'A';
