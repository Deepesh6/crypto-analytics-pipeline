
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    coin_id as unique_field,
    count(*) as n_records

from "postgres"."crypto_dev"."dim_coins"
where coin_id is not null
group by coin_id
having count(*) > 1



  
  
      
    ) dbt_internal_test