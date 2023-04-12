-- select au_lname as "Last Name", au_fname as "First Name" from pubs2.authors where au_lname like 'D%';

-- Find all titles with an undefined price in table titles
select title from pubs2.titles where price is null;


-- Find all titles with an undefined price in table titles

update pubs2.titles
set price = 20.00
where price is null;

-- a select statement to check whethe update of price was successful
select * from pubs2.titles where price = '20.00';

-- first 50 characters 
select substr(pr_info,1,50) from pubs2.pub_info;

SELECT LEFT(pr_info, 50) FROM pubs2.pub_info;


-- examine the postgres function referemce for alternative ways of converting 
select title, to_char(pubdate, 'Day, dd Month yyyy')
FROM pubs2.titles;

select ord_date, to_char(ord_date, 'Day ddth Month yyyy')
from pubs2.sales;


--SELECT TO_DATE(ord_date, 'YYYY-MM-DD') from pubs2.sales;

-- the alter keyword here is used to convert from date datatype to a string datatype (varchar)
ALTER TABLE pubs2.sales
ALTER COLUMN ord_date TYPE varchar(40);



update pubs2.sales
set ord_date = to_char(to_date(ord_date, 'YYYY-MM-DD'), 'DAY ddth Month yyyy');

select * from pubs2.sales;



