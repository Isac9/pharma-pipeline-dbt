
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select territory
from "dev"."main"."stg_sales"
where territory is null



  
  
      
    ) dbt_internal_test