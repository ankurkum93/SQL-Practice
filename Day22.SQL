Day 22 of #30daysofSQL//

Question:
Calculate the percentage of spam posts in all viewed posts by day. Note that the facebook_posts table stores all posts posted by users. The facebook_post_views table is an action table denoting if a user has viewed a post.
fb_search_results
query	varchar
result_id	int
position	int
notes	varchar

facebook_posts


post_id	int
poster	int
post_text	varchar
post_keywords	varchar
post_date	datetime

facebook_post_views


post_id	int
viewer_id	int


Solution:
select post_date, sum(
case
when post_keywords ilike '%spam%' then 1 
else 0 end ):: float/ count(*) * 100
from facebook_posts fp join facebook_post_views fpv
on fp.post_id=fpv.post_id
group by 1


approach:
In order to find out the percentage, I summed up the spammed post and divided that with the total viewed post .
I used ilike because it is case insensitive.
There can be performance issues when we compare ilike with like but my dataset was very small.


#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering



	
