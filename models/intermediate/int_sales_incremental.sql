with base as (
    select * from {{ ref('stg_sales') }}
),

incremental as (
    select
        week,
        territory,
        product,
        cumulative_units,
        cumulative_revenue_usd,

        -- Logique Week N = Cumul N - Cumul N-1
        cumulative_units - lag(cumulative_units, 1, 0) over (
            partition by territory, product
            order by week
        ) as weekly_units,

        cumulative_revenue_usd - lag(cumulative_revenue_usd, 1, 0) over (
            partition by territory, product
            order by week
        ) as weekly_revenue_usd

    from base
)

select * from incremental
where weekly_units >= 0