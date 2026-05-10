
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select last_updated
from "postgres"."crypto_dev"."fct_daily_prices"
where last_updated is null



  
  
      
    ) dbt_internal_test