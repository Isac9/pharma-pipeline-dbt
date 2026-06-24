
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select weekly_units
from "dev"."main"."int_sales_incremental"
where weekly_units is null



  
  
      
    ) dbt_internal_test