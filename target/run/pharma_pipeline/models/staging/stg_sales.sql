
  
  create view "dev"."main"."stg_sales__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."raw_sales"
),

cleaned as (
    select
        week,
        territory,
        product,
        cumulative_units,
        cumulative_revenue_usd,
        current_timestamp as loaded_at
    from source
    where territory is not null
      and product is not null
      and cumulative_units >= 0
      and cumulative_revenue_usd >= 0
)

select * from cleaned
  );
