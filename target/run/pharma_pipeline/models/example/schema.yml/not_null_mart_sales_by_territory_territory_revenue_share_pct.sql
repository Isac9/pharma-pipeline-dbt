
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select territory_revenue_share_pct
from "dev"."main"."mart_sales_by_territory"
where territory_revenue_share_pct is null



  
  
      
    ) dbt_internal_test