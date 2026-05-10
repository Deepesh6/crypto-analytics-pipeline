
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select coin_id
from "postgres"."crypto_dev"."fct_market_dominance"
where coin_id is null



  
  
      
    ) dbt_internal_test