
    
    

with all_values as (

    select
        product as value_field,
        count(*) as n_records

    from "dev"."main"."stg_sales"
    group by product

)

select *
from all_values
where value_field not in (
    'DrugA','DrugB'
)


