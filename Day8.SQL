Day 8 of #30daysofSQL//



Question:

Find the average weight of medal-winning Judo players of each team with a minimum age of 20 and a maximum age of 30. Consider players at the age of 20 and 30 too. Output the team along with the average player weight.



Table: olympics_athletes_events

id	int

name	varchar

sex	varchar

age	float

height	float

weight	datetime

team	varchar

noc	varchar

games	varchar

year	int

season	varchar

city	varchar

sport	varchar

event	varchar

medal	varchar



Solution:

select team, avg(weight) from olympics_athletes_events

where medal is not null

and age between 20 and 30

and lower (sport) in ('judo')

group by team;



Approach:



Since the weight has to be averaged for each team, I kept team in group by. In where, I have used between for age 20 and 30 also need to be included in the result. Since the question explicitly says medal winning, i had to filter out the null  values. I used 'in' in sport and lowered the entire column so as to get accurate results as in real dataset we never know what case the data is in.
