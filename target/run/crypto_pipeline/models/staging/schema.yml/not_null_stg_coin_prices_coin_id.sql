
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select coin_id
from "postgres"."crypto_dev"."stg_coin_prices"
where coin_id is null



  
  
      
    ) dbt_internal_test