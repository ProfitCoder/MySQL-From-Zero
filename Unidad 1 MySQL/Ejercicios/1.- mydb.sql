create database mydb;
use mydb;

Create table myTable(
	id int unsigned auto_increment, 
    username varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (id)
);

DESCRIBE myTable;

insert into myTable(username,email) values ('myuser', 'myuser@example.com');
insert into myTable(username,email) values ('myuser2', 'myuser2@example.com');

select * from mytable;
