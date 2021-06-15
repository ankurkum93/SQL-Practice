Day 16 of #30daysofSQL//

Question:
Find the top-ranked songs for the past 30 years

Table:

billboard_top_100_year_end
year	int
year_rank	int
group_name	varchar
artist	varchar
song_name	varchar
id	int

Solution:
select song_name from billboard_top_100_year_end
where year_rank=1
and year >= (select date_part('year', now())-30)

Approach:

I used date_part because I wanted to extract only the years from the date 
I subtracted 30 years from the current date.
I only wanted the top ranked song and hence year_rank=1
