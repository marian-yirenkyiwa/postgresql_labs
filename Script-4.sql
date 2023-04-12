-- a query to get average prices from the titles table for each type of book and convert type to char(30)
select type::char(30),avg(price::numeric)::money from pubs2.titles
group by type;



--a query to print the difference between(to a resolution of days) earliest and latest publication date in titles 
select age(max(pubdate)  , min(pubdate)) from pubs2.titles;
select max(pubdate) - min(pubdate) from pubs2.titles;



 -- a query to print the average, min and max book prices within the titles table organised into groups based on type and publisher id
select type, pub_id, avg(price::numeric)::money , min(price), max(price)
from pubs2.titles
group by type,pub_id;





-- a query to print the average, min and max book prices within the titles table organised into groups based on type and publisher id
select type, pub_id, 
avg(price::numeric)::money as "Avg_price", 
min(price) as "Min_price", 
max(price) as "Max_price"
from pubs2.titles 
group by type,pub_id
having avg(price::numeric)>20
order by "Avg_price";



-- List the books in order of the length of their title
select title, length(title) from pubs2.titles
order by length(title) desc;




--BUSINESS QUERIES
--What is the average age in months of each type of title
select type, avg(extract(month from age(current_date,pubdate))) as "avg_month"
from pubs2.titles
group by type;


select type, avg(current_date - pubdate) as "avg_month"
from pubs2.titles
group by type;

select type, sum(DATE_PART('day', (current_date) - pubdate)) 
from pubs2.titles
group by type;



-- how many authors live in each city
select city, count(city) from pubs2.authors    -- NB: You can use * to check the count
group by city;



-- a query to display the longest title
select title, max(length(title)) as "length"
from pubs2.titles
group by title
order by length desc limit 1;



--another alternative query to display the longest title
SELECT title FROM pubs2.titles ORDER BY LENGTH(title) DESC LIMIT 1;


-- How many books have been sold by each store and how many books have been sold in total
select stor_id, 
count(qty) as "Quantity Sold by Store", 
sum(qty) as "Total Books Sold"
from pubs2.sales
group by stor_id;


