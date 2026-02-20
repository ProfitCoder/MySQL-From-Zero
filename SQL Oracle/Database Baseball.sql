create table players(
    Player_ID int,
    first_name varchar2(50),
    Last_name varchar2(50),
    Primary key (Player_ID)
);

create table Stats(
    Player_ID int,
    Year int,
    AB int,
    HITS int,
    HR int,
    RBI int,
    TEAM varchar2(20),
    foreign key (Player_ID) references players (Player_ID)
);

insert into players values (1,'Barry','Bonds');
insert into players values (2,'Hank','Aaron');
insert into players values (3,'Babe','Ruth');
insert into players values (4,'Willie','Mays');
insert into players values (5,'Sammy','Sosa');

insert into stats values (1,2006,367,99,26,77,'SFG'); 
insert into stats values (1,2007,340,94,28,66,'SFG'); 
insert into stats values (2,1954,468,131,13,69,'MLN'); 
insert into stats values (2,1955,602,189,27,106,'MLN'); 
insert into stats values (2,1956,609,200,26,92,'MLN'); 

SELECT * FROM PLAYERS ORDER BY PLAYER_ID asc;

SELECT * FROM STATS ORDER BY PLAYER_ID asc;

-- 1. First, let's look at a query that simply lists data from three selected columns in the Stats table.

SELECT Player_id,year,hits
FROM Stats;

-- 2. List only those seasons in which the player had more than 50 home runs.

SELECT Player_ID,HR
FROM stats
where HR > 50;

-- 3. Sort query number 2 from high to low.To do that,we need to add an ORDER BY clause.

SELECT Player_ID,HR
FROM stats
WHERE HR > 50
ORDER BY Player_ID asc;

-- 4. The names from players table and the year and HR count from stats table for the 50+ HR subset.

SELECT p.First_name,p.Last_name,s.year,s.HR
FROM Players p
JOIN Stats s ON p.Player_ID = s.Player_ID
where hr >= 50;

-- 5. Players career home run total.

SELECT p.First_name,p.Last_name,SUM(s.HR) as Total_HomeRun
FROM Players p
JOIN Stats s ON p.player_ID = s.player_id
GROUP BY p.Player_ID,p.First_name,p.Last_name
having SUM(s.HR) > 0;