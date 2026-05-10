
 -- This is your central fact table — one row per coin per day containing all metrics. 
 -- containing facts/numerical value only

 with source as (
    Select  * from "postgres"."crypto_dev"."stg_coin_prices"
    
        where fetched_at > (select max(fetched_at) from "postgres"."crypto_dev"."fct_daily_prices")
    
 )

 , final as (
    Select coin_id,
        fetched_at,
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
        coalesce(high_24h, current_price) - coalesce(low_24h, current_price) as volatility,
        round((
            (coalesce(high_24h, current_price) - coalesce(low_24h, current_price)) *  100.0 / nullif(current_price, 0))::numeric, 2) 
        as volatility_percentage

        from source
 )

 Select * from final

 -- python Operator - Run python functions
 -- Bash Operator - Run Shell/Linux Commands

 -- Python Operator -> Executes python codes/functions
 -- Bash Operator -> Running shell/terminal commands


 -- in WSL
-- D:\ = /mnt/d/