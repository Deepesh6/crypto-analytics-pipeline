{{ config(materialized='incremental',
    unique_key = ['coin_id', 'fetched_at']) }}

with fact as (
    Select * from {{ref('fct_daily_prices')}}
    {% if is_incremental() %}
        where fetched_at > (select max(fetched_at) from {{ this }})
    {% endif %}

)
, dim_coins as (
    Select * from {{ref('dim_coins')}}
)

, intermediate as (
    Select d.coin_id, d.name, f.market_cap, f.fetched_at
    from fact f 
    inner join dim_coins d 
    on f.coin_id = d.coin_id 
)

, final as (
    Select coin_id, name, 
    market_cap, 
    sum(market_cap) over (partition by fetched_at) as total_market_cap,
    market_cap * 100.0 / sum(market_cap) over (partition by fetched_at) as dominance_percentage,
    fetched_at
    from intermediate
)

Select * 
from final
order by fetched_at desc

-- to find the running sum --> 
-- to find the absolute sum --> 