



-- Windows functions:

-- aggragate function
select new_id,cata,
sum(new_id) over(partition by cata order by new_id) as total,
avg(new_id) over(partition by cata order by new_id) as average,
count(new_id) over(partition by cata order by new_id) as count,
min(new_id) over(partition by cata order by new_id) as min,
max(new_id) over(partition by cata order by new_id) as max
from testdata;


-- range--> 
        -- select all the row of the partition
       -- rows between UNBOUNDED PRECEDING and unbounded following

select new_id,cata,
sum(new_id) over(partition by cata order by new_id rows between unbounded preceding and unbounded following) as total,
avg(new_id) over(partition by cata order by new_id rows between unbounded preceding and unbounded following) as average,
count(new_id) over(partition by cata order by new_id rows between unbounded preceding and unbounded following) as count,
min(new_id) over(partition by cata order by new_id rows between unbounded preceding and unbounded following) as min,
max(new_id) over(partition by cata order by new_id rows between unbounded preceding and unbounded following) as max
from testdata;

-- --Windows functions row-number,rank,dense_rank,percent_rank
select new_id,
row_number() over( order by new_id) as "Row_number",
rank() over( order by new_id) as "Rank",
dense_rank() over( order by new_id) as "Dense_rank",
percent_rank() over( order by new_id) as "percent_rank"
from testdata;

-- --functions first-value,last-value,lead,lag
select new_id,
first_value(new_id) over( order by new_id) as "First-value",
last_value(new_id) over( order by new_id rows between unbounded preceding and unbounded following) as "last-value",
lead(new_id,2) over( order by new_id) as "Lead",
lag(new_id,2) over( order by new_id) as "Lag"
from testdata;




     

     

     
     
