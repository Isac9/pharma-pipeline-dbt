
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cumulative_units
from "dev"."main"."stg_sales"
where cumulative_units is null



  
  
      
    ) dbt_internal_test