drop table student;
create table student(
sid integer primary key,
name varchar(20),
major varchar(20)
);

drop table project;
create table project(
pid integer primary key,
ptitle varchar(20)
);

drop table course;
create table course(
cid integer primary key,
title varchar(20)
);

drop table memeber;
create table memeber(
pid integer,
sid integer,
foreign key (pid) references project(pid),
foreign key (sid) references student(sid)
);

drop table enrolled;
create table enrolled(
sid integer,
cid integer,
foreign key (sid) references student(sid),
foreign key (cid) references course(cid)
);





INSERT INTO student VALUES(16,'Alcott','Louisa May');
INSERT INTO student VALUES(115,'Poe','Edgar Allen');
INSERT INTO student VALUES(116,'Archer','Jeffery'); 
INSERT INTO student VALUES(1111,'Denham','Ariel');
INSERT INTO student VALUES(1212,'Worsley','John');
INSERT INTO student VALUES(1213,'Brookins','Andrew');
INSERT INTO student VALUES(1533,'Brautigan','Richard');
INSERT INTO student VALUES(1644,'Hogarth','Burne');
INSERT INTO student VALUES(1717,'Brite','Poppy Z.');
INSERT INTO student VALUES(1809,'Seuss','Geisel');
INSERT INTO student VALUES(1866,'Herbert','Frank');
INSERT INTO student VALUES(2001,'Clarke','Arthur C.');
INSERT INTO student VALUES(2031,'Brown','Margaret Wise');
INSERT INTO student VALUES(2112,'Gorey','Edward');
INSERT INTO student VALUES(4156,'King','Stephen');
INSERT INTO student VALUES(4157,'King','Stephen'); 
INSERT INTO student VALUES(7805,'Lutz','Mark');
INSERT INTO student VALUES(7806,'Christiansen','Tom');
INSERT INTO student VALUES(15990,'Bourgeois','Paulette');
INSERT INTO student VALUES(25041,'Bianco','Margery Williams');


INSERT INTO student VALUES(1,'1hao','CS');
INSERT INTO student VALUES(2,'2hao','CS');
INSERT INTO student VALUES(3,'3hao','CS');
INSERT INTO student VALUES(4,'4hao','CS');
INSERT INTO student VALUES(5,'5hao','CS');

INSERT INTO student VALUES(6,'6','CE');
INSERT INTO student VALUES(7,'7','ce');
INSERT INTO student VALUES(8,'8','ce');
INSERT INTO student VALUES(9,'9','ce');
INSERT INTO student VALUES(10,'10','10');
INSERT INTO student VALUES(11,'11','11');
INSERT INTO student VALUES(12,'12','ce');
INSERT INTO student VALUES(13,'13','ee');



INSERT INTO project VALUES(1,'p1');
INSERT INTO project VALUES(2,'p2');


insert into course values(1,'c1');
INSERT INTO course VALUES(2,'c2');
insert into course values(3,'EECS482');
insert into course values(4,'EECS484');
insert into course values(5,'EECS582');
insert into course values(6,'EECS584');

insert into memeber values(1,1);
insert into memeber values(1,2);
insert into memeber values(2,1);
insert into memeber values(2,3);




insert into enrolled values(1,1);
insert into enrolled values(1,2);
insert into enrolled values(2,1);
insert into enrolled values(2,2);
insert into enrolled values(3,1);
insert into enrolled values(4,2);





