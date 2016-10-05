-- Homework #2: EECS 484.
-- Your uniquname:haibinzh, sunche
-- include your teamate's uniqname if you are working in a team of two
-- We use the 'PROMPT' command to print out the problem number. DO NOT DELETE THAT, otherwise this may cause you failing the testcases.

-- Your answer should work for any instance of the database, not just the one given.

-- EXAMPLE
-- Q0: "list titles of all books". Answer given below.

SELECT title FROM books;

-- Q1
PROMPT Question 5.1;
-- List the ISBN of all books written by "Geisel Seuss"
select isbn from editions E,books B,authors A where A.last_name='Seuss' and A.first_name='Geisel' and A.author_id=B.author_id
    and B.book_id=E.book_id;

-- Q2
PROMPT Question 5.2;
-- List last name and first name of authors who have written both
-- Short Story and Horror books. In general, there could be two different authors
-- with the same name, one who has written a horror book and another
-- who has written short stories. 
select distinct last_name,first_name from authors A,subjects S1,subjects S2,books B1,books B2
    where A.author_id = B1.author_id and B1.subject_id=S1.subject_id and S1.subject='Short Story'
        and A.author_id=B2.author_id and B2.subject_id=S2.subject_id and S2.subject='Horror';

-- Q3
PROMPT Question 5.3;
-- List titles, publication, author's id, author's last name, and author's first name of all books 
-- by authors who have published a book after 1990-01-01 but before 2000-01-01. 
-- Note: this may require a nested query. The answer can include books that are not published in between 
-- the publication requirements. You can also use views. But DROP any views at the end of your query.
-- Using a single query is likely to be more 
-- efficient in practice. Moreover, there shouldn't be any duplication for the returned records.
create view view_Q3 as
(select distinct author_id from books B,editions E
where B.book_id=E.book_id and E.publication>'1990-01-01' and E.publication<'2000-01-01');

select distinct B.title,E.publication,V.author_id,A.last_name,A.first_name from view_Q3 V 
join authors A on V.author_id=A.author_id
join books B on V.author_id=B.author_id
left join editions E on B.book_id=E.book_id;

drop view view_Q3;
-- Q4
PROMPT Question 5.4;
-- Find id, first name, and last name of authors who wrote books for all the 
-- subjects of books written by Edgar Allen Poe.

create view view_subjects as
(select S.subject_id from subjects S, books B2, authors A where S.subject_id=B2.subject_id and B2.author_id=A.author_id and A.first_name='Edgar Allen' and A.last_name='Poe'
);

select A2.author_id,A2.first_name,A2.last_name from authors A2
where not exists
(select V.subject_id from view_subjects V 
	where not exists(
		select B1.author_id from books B1
			where V.subject_id=B1.subject_id and A2.author_id=B1.author_id)
);

drop view view_subjects;




 
-- Q5
PROMPT Question 5.5;
-- Find the last name and first name of authors who haven't written any book.
select distinct last_name,first_name from authors
MINUS
select distinct last_name,first_name from authors A,books B
where A.author_id=B.author_id;



-- Q6
PROMPT Question 5.6; 
-- Find the book_id and its corresponding total stock available for all book editions ordered
--     in descending order by the total stock. Name the column for total stock as NUM_STOCK. 
--     NOTE: You do not need to consider editions of books that are not in the Stock Table.
select B.book_id,sum(S.stock) from editions B,stock S 
where B.isbn=S.isbn 
group by B.book_id
order by sum(S.stock) desc;



-- Q7
PROMPT Question 5.7;
-- Find author_id, last_name and first_name of authors who have written exactly 1 book. Name the author_id column as id. 
-- Order the id in ascending order. You may use view or nested query to solve this problem.
create view view_Q7 as(
select distinct A.author_id,A.last_name,A.first_name from authors A,books B where A.author_id=B.author_id
MINUS
(select distinct A.author_id,A.last_name,A.first_name from authors A,books B1,books B2 where A.author_id=B1.author_id and A.author_id=B2.author_id and B1.book_id <> B2.book_id));

select * from view_Q7
order by author_id asc;

drop view view_Q7;



-- Q8
PROMPT Question 5.8;
-- Find the name and id of all publishers who have published books for authors
-- who have written exactly 1 book or exactly 2 books. Result should be ordered by publisher id in ascending order;
create view view_Q8 as
(select author_id from books B
group by author_id having count(B.book_id)=1 or count(B.book_id)=2);


select distinct P.name,P.publisher_id from publishers P,books B,editions E,view_Q8 V
where P.publisher_id=E.publisher_id and E.book_id=B.book_id and V.author_id=B.author_id
order by P.publisher_id asc;

drop view view_Q8;

