
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_volume
from "postgres"."crypto_dev"."stg_coin_prices"
where total_volume is null



  
  
      
    ) dbt_internal_test