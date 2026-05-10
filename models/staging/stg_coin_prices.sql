{{ config(materialized='view') }}

with source as (
    select * from {{ source('crypto_raw', 'daily_prices') }}
),

deduplicated as (
    select *,
        row_number() over (
            partition by id, DATE(fetched_at)
            order by fetched_at desc
        ) as rn
    from source
),

final as (
    select
        id as coin_id,
        symbol,
        name,
        current_price,
        market_cap,
        market_cap_rank,
        total_volume,
        high_24h,
        low_24h,
        price_change_24h,
        price_change_percentage_24h,
        circulating_supply,
        last_updated,
        fetched_at
    from deduplicated
    where rn = 1
)

select * from final