with base as (
    select * from {{ ref('int_sales_incremental') }}
),

final as (
    select
        territory,
        product,
        week,
        weekly_units,
        weekly_revenue_usd,

        -- Cumuls reconstruits
        sum(weekly_units) over (
            partition by territory, product
            order by week
        ) as running_units,

        sum(weekly_revenue_usd) over (
            partition by territory, product
            order by week
        ) as running_revenue_usd,

        -- Part de chaque territoire par semaine
        round(
            100.0 * weekly_revenue_usd / nullif(
                sum(weekly_revenue_usd) over (partition by week, product), 0
            ), 2
        ) as territory_revenue_share_pct

    from base
)

select * from final
order by product, territory, week