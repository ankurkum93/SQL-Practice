Day 21 of #30daysofSQL//

Question:
Facebook has developed a search algorithm that will parse through user comments and present the results of the search to a user. To evaluate the performance of the algorithm, we are given a table that consists of the search result the user clicked on ('notes' column), the user's search query, and the resulting search position that was returned for the specific comment. 

The higher the position, the better, since these comments were exactly what the user was searching for. Write a query that evaluates the performance of the search algorithm against each user query. Refer to the hint section for more specifics on how to write the query.

fb_search_results
query	varchar
result_id	int
position	int
notes	varchar


Solution:
with cte as (select result_id, query, position, 
case when
regexp_replace(notes, '[^\w]', ' ', 'g') ilike concat('% ', query, ' %') then 1 else 0 end as has
from fb_search_results)
select result_id, query,
case
when position between 1 and 3 and has= 1 then 5
when position in (4,5) and has= 1 then 4
when position >= 6 and position <=10 and has= 1 then 3
when position >11 and has= 1 then 2
when has=0 then 1
end as rating
from cte
;



#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering
