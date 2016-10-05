create view non_heavily_CS_C as
 (select C.cid from Course C,Student S2,Enrolled E where count(S2.sid)>100 and C.cid=E.cid and E.sid=S2.sid and S2.major <>'CS');

select distinct sid,name from Student S,non_heavily_CS_C N,Enrolled E
where S.sid=E.sid and E.cid = N.cid
order by S.name desc;

drop view non_heavily_CS_C;
