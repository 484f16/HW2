### -- Q2
PROMPT Question 5.2;
-- List last name and first name of authors who have written both Short Story and Horror books. 

In general, there could be two different authors with the same name, one who has written a horror book and another who has written short stories. 
so, remember to use the primary key to identify to get data.

### -- Q3
PROMPT Question 5.3;
-- List titles, publication, author's id, author's last name, and author's first name of all books 
-- by authors who have published a book after 1990-01-01 but before 2000-01-01. 
-- Note: this may require a nested query. The answer can include books that are not published in between 
-- the publication requirements. You can also use views. But DROP any views at the end of your query.
-- Using a single query is likely to be more 
-- efficient in practice. Moreover, there shouldn't be any duplication for the returned records.

left join
for some info might be not exist
when use or get data through diff tables, you need to notify that some id in one table may not have the corresponding id in other tables.
so take the join into account.



### -- Q4
PROMPT Question 5.4;
-- Find id, first name, and last name of authors who wrote books for all the subjects of books written by Edgar Allen Poe.

ha, it's funny when using 'where not exists'
in  general:
the outer we need, 
where not exists( 
the origin data
where not exists(
the bridge
where O.id=B.id and B.id=G.id
