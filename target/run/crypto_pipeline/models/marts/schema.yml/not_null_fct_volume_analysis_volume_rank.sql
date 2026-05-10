
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select volume_rank
from "postgres"."crypto_dev"."fct_volume_analysis"
where volume_rank is null



  
  
      
    ) dbt_internal_test