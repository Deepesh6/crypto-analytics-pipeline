
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dominance_percentage
from "postgres"."crypto_dev"."fct_market_dominance"
where dominance_percentage is null



  
  
      
    ) dbt_internal_test