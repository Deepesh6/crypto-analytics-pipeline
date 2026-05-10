

with source as (
    select * from "postgres"."crypto_raw"."daily_prices"
    -- schema_name, table name in schema

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
    from source

)
select * from final