with students as (
    
    select 'alberto' as student_name union all 
    select 'antoine' union all
    select 'boutayna' union all 
    select 'christine' union all 
    select 'francois' union all 
    select 'hugo' union all 
    select 'huseyin' union all 
    select 'julien' union all 
    select 'matthieu' union all 
    select 'merveille' union all
    select 'paul' union all
    select 'quentin' union all
    select 'theo' union all
    select 'tom' 
    
)

select 
    student_name
from students
order by rand()
limit 5