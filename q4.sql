create view StudentPairs as(
select distinct M1.sid as sid1,M2.sid as sid2 from Member M1,Member M2, Enrolled E1, Enrolled E2
where (M1.sid<>M2.sid and M1.sid=E1.sid and M2.sid=E2.sid and M1.pid<>M2.pid and E1.cid=E2.cid and M1.sid<M2.sid);

