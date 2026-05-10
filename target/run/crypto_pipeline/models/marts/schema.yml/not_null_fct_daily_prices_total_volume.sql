
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_volume
from "postgres"."crypto_dev"."fct_daily_prices"
where total_volume is null



  
  
      
    ) dbt_internal_test