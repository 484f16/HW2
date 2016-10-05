select distinct S.name,S.sid from Students S,Enrolled E1,Enrolled E2,Course C1,Course C2,Memember M1,Memember M2
where S.sid = M1.sid and M1.pid=M2.pid and M1.sid<>M2.sid and E1.cid = C1.cid and M2.sid = E2.sid and E2.cid = C2.cid and M2.sid=E1.sid
and (C1.title='EECS482' or C1.title='EECS483')and (C2.title='EECS484' or C2.title='EECS485');
