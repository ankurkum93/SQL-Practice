Day 12 of #30daysofsql//


Question:
Find the average height of RB position players by division.
Output the team division along with the average height.



Table1:
college_football_teams

division varchar
conference varchar
school_name varchar
roster_url varchar
id int

Table2:
college_football_players

full_school_name varchar
school_name varchar
player_name varchar
position varchar
height float
weight float
year varchar
hometown varchar
state varchar
id int

Solution:
select division,
avg(height)
from college_football_teams cft
join college_football_players cfp
using(id)
where position like 'RB'
group by 1;

Approach:
I used group in order to print position of players by division
and where clause because I had to output only 'RB' position 
and avg because we need the average height

