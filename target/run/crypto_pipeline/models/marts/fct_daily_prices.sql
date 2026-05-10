
      
        delete from "postgres"."crypto_dev"."fct_daily_prices" as DBT_INTERNAL_DEST
        where (coin_id, fetched_at) in (
            select distinct coin_id, fetched_at
            from "fct_daily_prices__dbt_tmp112025022533" as DBT_INTERNAL_SOURCE
        );

    

    insert into "postgres"."crypto_dev"."fct_daily_prices" ("coin_id", "fetched_at", "current_price", "market_cap", "market_cap_rank", "total_volume", "high_24h", "low_24h", "price_change_24h", "price_change_percentage_24h", "circulating_supply", "last_updated", "volatility")
    (
        select "coin_id", "fetched_at", "current_price", "market_cap", "market_cap_rank", "total_volume", "high_24h", "low_24h", "price_change_24h", "price_change_percentage_24h", "circulating_supply", "last_updated", "volatility"
        from "fct_daily_prices__dbt_tmp112025022533"
    )
  