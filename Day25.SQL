Day 25 of #30daysofSQL//


ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

fraud_score

policy_num	varchar
state	varchar
claim_cost	int
fraud_score	float

Solution:
with cte as (select *, percent_rank() over(partition by state order by fraud_score desc) as rn from fraud_score
group by fraud_score, state, policy_num,claim_cost
)
select policy_num,state,claim_cost,fraud_score  from cte
where rn<=0.05


approach:
I used percent_rank to evaluate the  relative ranking of every value within the given set.
I then used  a cte approach as it is cleaner than a subquery and easy to read and understand


#sqlqueries #sql #dataanalytics #database #dailycoding #365daysofcode #databasedevelopment #datafam #sqlfamily #30daysofSQL #postgresql #sqlserver #dataanalysis #databasequeries #dailycoding #365daysofcode #66daysofdata #datasciences #365daysofsql #dailyposts #mysql #dataengineering

