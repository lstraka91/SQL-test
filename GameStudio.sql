create  user strakal
identified by p4ssw0rd
default tablespace users
temporary tablespace temp
quota 10m on users;

grant connect to strakal;
grant resource to strakal;
grant create session to strakal;
grant create table to strakal;
grant create view to strakal;

conn strakal/p4ssw0rd


--**********************************--

--create table GAME (
--id_game INTEGER PRIMARY KEY,
--name VARCHAR2 (20) NOT NULL,
--author VARCHAR2(20) NOT NULL,
--date_created DATE NOT NULL,
--url VARCHAR2(100) NOT NULL
--);


--create sequence gameIncrement increment by 1;


create sequence userIncrement increment by 1;
--create table PLAYER(
--id_user INTEGER PRIMARY KEY,
--name VARCHAR2 (20) NOT NULL UNIQUE,
--password VARCHAR2(20) NOT NULL,
--email VARCHAR2(50)NOT NULL UNIQUE,
--date_registration DATE NOT NULL

--);
--
--create table score(
--id_user INTEGER REFERENCES player(id_user),
--id_game INTEGER REFERENCES game(id_game),
--score INTEGER NOT NULL,
--date_played DATE NOT NULL,
--check (score >= 0)
--);
--
--create table rating(
--id_user INTEGER REFERENCES player(id_user),
--id_game INTEGER REFERENCES game(id_game),
--rating INTEGER NOT NULL,
--date_rate DATE NOT NULL,
--check (rating >= 1 AND rating<=5),
--primary key (id_user, id_game)
--);
--
--create table comments (
--id_user INTEGER REFERENCES player(id_user),
--id_game INTEGER REFERENCES game(id_game),
--comments VARCHAR2(255) NOT NULL,
--date_comment DATE NOT NULL
--);

insert into Game( 
id_game, name, author, date_created, url)
values (gameincrement.nextval, 'Tetris', 'ITmanik', SYSDATE , 'www.gamecenter/Tetris');

insert into Game( 
id_game, name, author, date_created, url)
values (gameincrement.nextval, 'PACMAN', 'ITmanik', SYSDATE -1 , 'www.gamecenter/Pacman');

insert into Game( 
id_game, name, author, date_created, url)
values (gameincrement.nextval, 'Minesweeper', 'GameDajzrner', SYSDATE -10 , 'www.gamecenter/Minesweeper');

insert into Game( 
id_game, name, author, date_created, url)
values (gameincrement.nextval, 'sTONES', 'PUzzle_Architect', SYSDATE+2 , 'www.gamecenter/stones');

select * from game;

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'andrej', '132456', 'andrej@gamecenter.sk', SYSDATE - 10);

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'rudo', '789654', 'rudo@gamecenter.sk', SYSDATE -3);

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'fero', '1456143', 'feri@gamecenter.sk', SYSDATE + 10);

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'huzo', '7896514456', 'huzo@gamecenter.sk', SYSDATE );

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'king', '346', 'kral@gamecenter.sk', SYSDATE +2);

insert into PLAYER 
(id_user, name, password, email, date_registration )
values (userIncrement.nextval, 'gejza', '16783123fewr', 'gejza@gamecenter.sk', SYSDATE +1);

select * from PLAYER;
--update player set PASSWORD='fdafa678' where ID_USER=1; 

--alter table player add check (length(PASSWORD)>= 6);
alter table score 
MODIFY (date_played tIMESTAMP );

insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(1,5,456,SYSTIMESTAMP - INTERVAL '1' MINUTE );  

insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(3,4,1695,SYSTIMESTAMP );  


insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(3,4,56,SYSTIMESTAMP ); 


insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(3,4,0,SYSTIMESTAMP ); 


insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(3,2,195,SYSTIMESTAMP ); 


insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(1,4,954,SYSTIMESTAMP ); 


insert into SCORE (
ID_USER,ID_GAME, score, date_played) 
values(1,5,755,SYSTIMESTAMP ); 

select * from score;

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(1,5,4, SYSDATE -1); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(2,4,1, SYSDATE ); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(2,1,3, SYSDATE +1); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(1,1,5, SYSDATE -1); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(4,1,1, SYSDATE ); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(2,3,1, SYSDATE); 

insert into RATING (
ID_USER,ID_GAME, RATING, DATE_RATE) 
values(4,3,5, SYSDATE);
select * from RATING;

insert into COMMENTS(
ID_GAME,ID_USER, comments, date_comment)
values (1,5,'WAAAAAAAAU very good game ', SYSDATE -2);

insert into COMMENTS(
ID_GAME,ID_USER, comments, date_comment)
values (4,1,'OMG thats the shit ', SYSDATE -1);

insert into COMMENTS(
ID_GAME,ID_USER, comments, date_comment)
values (1,4,'how to play? ', SYSDATE -4);

insert into COMMENTS(
ID_GAME,ID_USER, comments, date_comment)
values (2,4,'neheheh highscore', SYSDATE +2);

insert into COMMENTS(
ID_GAME,ID_USER, comments, date_comment)
values (3,5,'it is my game  ', SYSDATE );

select * from comments;

--1 ULOHAAAAA Zoznam hráèov utriedený pod¾a dátumu registrácie
create view uloha1 as  select name, DATE_REGISTRATION from player order by DATE_REGISTRATION;
select * from uloha1;

--2 ULOHAAAAAA  Zoznam hier
create view uloha2 as select name, AUTHOR, url from game; 
select * from uloha2;

--3 ULOHAA  Zoznam hier s komentármi a menami používate¾ov
create view uloha3 as  select g.name as GameName , p.NAME as playerName, c.COMMENTS from COMMENTS c join GAME g on g.ID_GAME = c.ID_GAME join player p on p.ID_USER = c.ID_USER order by g.name;
select * from uloha3;

--4 ULOHA Hráè s najdlhším menom
create view uloha4 as select name from PLAYER where length(NAME) = (select MAX(length(name))from player );
select * from uloha4;

--uloha 5  Zoznam hier, ktoré nehral nikto (nemajú záznam v Score)
create view uloha5 as select g.NAME, g.URL from game g  left join score s on s.ID_GAME = g.ID_GAME where s.ID_GAME is null;
select * from uloha5;

--uloha 6    Zoznam používate¾ov, ktorí nehodnotili žiadnu hru
create view uloha6 as select p.name,p.EMAIL from player p left join RATING r on r.ID_USER = p.ID_USER where r.ID_USER is null ;
select * from uloha6;

--uloha 7  Zoznam používate¾ov, ktorí nehodnotili jednu konkrétnu hru (napr. Minesweeper)
create view ratingMinesweeper as select p.* from rating r join player p on r.ID_USER = p.ID_USER join game g on r.ID_GAME = g.ID_GAME where g.NAME like 'Minesweeper';
create view uloha7 as select distinct p.NAME from RATING r right join player p  on r.ID_USER = p.ID_USER left join game g on r.ID_GAME = g.ID_GAME where r.ID_GAME is null OR p.NAME not in (SELECT NAME from RATINGMINESWEEPER);
select * from uloha7; 

--uloha 8  Poèet hier, poèet hráèov, poèet komentárov, poèet hodnotení
create view uloha8 as select (select COUNT(*) from game)as pocet_hier,(select COUNT(*)from player) as pocet_hracov ,(select COUNT(*) from COMMENTS) as pocet_komentarov,(select COUNT(*) from RATING) as pocet_hodnoteni from dual ;
select * from uloha8;

--uloha9  Najstaršia hra
select min(DATE_CREATED) from game;
create view uloha9 as select name from game where DATE_CREATED=(select min(DATE_CREATED) from game);
select * from uloha9;

--uloha10 Zoznam hier s ich priemerným ratingom a poètom hodnotení
create view uloha10 as select g.name, COUNT(*) as pocet_hodnoteni ,round(avg(r.RATING),2)as priemerne_hodnotenie from RATING r join game g on r.ID_GAME = g.ID_GAME group by g.name;
select * from uloha10;

--uloha 11 Najviac komentované hry
create view pocetKomentarov as select g.NAME, COUNT(g.ID_GAME)as pocet_komentarov FROM COMMENTS c join game g on g.ID_GAME = c.ID_GAME group by g.NAME  ;
create view uloha11 as select name, POCET_KOMENTAROV from POCETKOMENTAROV where POCET_KOMENTAROV= (select max(POCET_KOMENTAROV)FROM POCETKOMENTAROV);
select * from uloha11;

--uloha 12  Zoznam hráèov s ich poètom hraním hier a celkovým skóre, ktoré nahrali 
create view uloha12 as select p.ID_USER,p.name as hrac,g.name as nazov_hry,g.ID_GAME, COUNT(*)as pocet_Hrani , sum(s.SCORE) as celkove_skore from score s join PLAYER p on s.ID_USER = p.ID_USER join game g on s.ID_GAME = g.ID_GAME GROUP by p.NAME,g.NAME,p.ID_USER,g.ID_GAME ;
select * from uloha12;

--uloha 13 Meno hráèa, ktorý hral naposledy hru
create view uloha13 as select p.name as hrac ,g.NAME as hra , s.DATE_PLAYED from score s join player p on s.ID_USER = p.ID_USER join game g on s.ID_GAME = g.ID_GAME where s.DATE_PLAYED=(select max(DATE_PLAYED) from score);
select * from uloha13;

--uloha 14 Poèet komentárov pre najob¾úbenejšiu hru
create view pocet_hrani as select g.name,g.ID_GAME ,count(*) as pocet_hrani from score s join game g on s.ID_GAME = g.ID_GAME group by g.NAME,g.ID_GAME;
create view uloha14 as select name,max(POCET_HRANI) as pocet_hrani, COUNT(c.ID_GAME)as pocet_komentarov from POCET_HRANI p join comments c on p.ID_GAME = c.ID_GAME where POCET_HRANI=(select max(POCET_HRANI)from POCET_HRANI)  group by p.NAME;
select * from uloha14;

--uloha15 Mená hráèov s poètom komentárov, ktoré pridali k hrám
create view uloha15 as select p.NAME as Hrac,g.name as nazov_hry, COUNT(*)as pocet_komentarov from COMMENTS c join PLAYER p on p.ID_USER = c.ID_USER join game g on g.ID_GAME = c.ID_GAME group by p.NAME,g.NAME order by g.NAME;
select * from uloha15;


--   INDEXY pre tabulku player 

create index ixPlayer on Player(name);
-- INDEX sCORE
create index ixScore on Score(score);