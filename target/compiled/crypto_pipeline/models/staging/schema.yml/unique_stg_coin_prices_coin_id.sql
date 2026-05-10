
    
    

select
    coin_id as unique_field,
    count(*) as n_records

from "postgres"."crypto_dev"."stg_coin_prices"
where coin_id is not null
group by coin_id
having count(*) > 1


