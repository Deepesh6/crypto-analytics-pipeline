
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select fetched_at
from "postgres"."crypto_dev"."stg_coin_prices"
where fetched_at is null



  
  
      
    ) dbt_internal_test