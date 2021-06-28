Day 28 of #30daysofSQL//


Find players who participated in the Olympics representing more than one team.
Output the player name, team, games, sport, and the medal.

olympics_athletes_events

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

select name, team, games,sport,medal from olympics_athletes_events
where team ilike '%/%'
group by 1,2,3,4,5
order by 1

approach:
I used ilike operator because teams are separated by '/' if  more than 1


#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering


