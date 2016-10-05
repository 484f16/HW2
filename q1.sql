select distinct S.name,S.sid from Student S,Course C1, Course C2, Enrolled E1,Enrolled E2 
	where S.sid = E1.sid and E1.cid = C1.cid and S.sid=E2.sid and E2.cid=C2.cid 
	and (C1.title='EECS482'and C2.title='EECS484' or C1.title='EECS582'and C2.title='EECS584');

