
# Pharma Pipeline — dbt Core + DuckDB

End-to-end pharmaceutical sales pipeline built with dbt Core and DuckDB.  
Replicates a real-world sales reporting workflow across 20+ territories.

## Project Overview

Pharmaceutical distributors submit **cumulative weekly sales files** per territory and product.  
The core challenge: computing **actual weekly sales** from cumulative data.

**Solution:** Incremental deduplication using SQL window functions.

## Architecture
seeds/

└── raw_sales.csv                    ← Raw cumulative sales data
models/

├── staging/

│   └── stg_sales.sql                ← Cleaning & validation layer

├── intermediate/

│   └── int_sales_incremental.sql    ← Incremental logic (LAG window function)

└── marts/

└── mart_sales_by_territory.sql  ← Final mart with market share metrics

## Pipeline Lineage
raw_sales → stg_sales → int_sales_incremental → mart_sales_by_territory

## Key Technical Decisions

- **Incremental logic via LAG()** — partitioned by territory and product, ordered by week
- **Data quality tests** — not_null, accepted_values on every critical column
- **Layered architecture** — staging / intermediate / marts separation
- **DuckDB** — zero-infrastructure local analytics engine

## Models

| Model | Materialization | Description |
|---|---|---|
| `stg_sales` | view | Cleaned and validated raw sales data |
| `int_sales_incremental` | view | Weekly actual sales via cumulative differencing |
| `mart_sales_by_territory` | table | Final mart with running totals and market share |

## Data Tests

| Test | Model | Column |
|---|---|---|
| not_null | stg_sales | week, territory, product, cumulative_units |
| accepted_values | stg_sales | product (DrugA, DrugB) |
| not_null | int_sales_incremental | weekly_units |
| not_null | mart_sales_by_territory | territory_revenue_share_pct |

## Stack

- **dbt Core** 1.11
- **DuckDB** 1.5.4
- **Python** 3.14

## Getting Started

```bash
pip install dbt-duckdb
dbt seed
dbt run
dbt test
dbt docs generate && dbt docs serve
```

## Business Context

Built to replicate production ETL pipelines used in pharmaceutical sales reporting —  
tracking weekly sell-out across territories, products, and distribution channels.