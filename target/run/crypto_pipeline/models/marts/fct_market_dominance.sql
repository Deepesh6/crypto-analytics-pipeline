
      
        delete from "postgres"."crypto_dev"."fct_market_dominance" as DBT_INTERNAL_DEST
        where (coin_id, fetched_at) in (
            select distinct coin_id, fetched_at
            from "fct_market_dominance__dbt_tmp112028654424" as DBT_INTERNAL_SOURCE
        );

    

    insert into "postgres"."crypto_dev"."fct_market_dominance" ("coin_id", "name", "market_cap", "total_market_cap", "dominance_percentage", "fetched_at")
    (
        select "coin_id", "name", "market_cap", "total_market_cap", "dominance_percentage", "fetched_at"
        from "fct_market_dominance__dbt_tmp112028654424"
    )
  