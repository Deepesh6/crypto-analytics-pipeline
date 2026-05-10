

with facts as (
    Select * from "postgres"."crypto_dev"."fct_daily_prices"
    
        where fetched_at > (select max(fetched_at) from "postgres"."crypto_dev"."fct_volume_analysis")
    
)
, dim_coins as (
    Select * from "postgres"."crypto_dev"."dim_coins"
)

, intermediate as (
    Select d.coin_id, d.name, f.total_volume, f.fetched_at
    from facts f
    inner join dim_coins d
    on f.coin_id = d.coin_id
)
, final as (
    Select coin_id, 
    name, 
    total_volume, 
    dense_rank() over (partition by fetched_at order by total_volume desc) as volume_rank, 
    fetched_at
    from intermediate
)
Select * from final 
order by fetched_at desc, volume_rank