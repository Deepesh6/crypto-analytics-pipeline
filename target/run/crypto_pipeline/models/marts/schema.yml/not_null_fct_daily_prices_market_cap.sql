
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select market_cap
from "postgres"."crypto_dev"."fct_daily_prices"
where market_cap is null



  
  
      
    ) dbt_internal_test