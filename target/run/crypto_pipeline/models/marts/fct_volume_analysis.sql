
      
        delete from "postgres"."crypto_dev"."fct_volume_analysis" as DBT_INTERNAL_DEST
        where (coin_id, fetched_at) in (
            select distinct coin_id, fetched_at
            from "fct_volume_analysis__dbt_tmp112028654424" as DBT_INTERNAL_SOURCE
        );

    

    insert into "postgres"."crypto_dev"."fct_volume_analysis" ("coin_id", "name", "total_volume", "volume_rank", "fetched_at")
    (
        select "coin_id", "name", "total_volume", "volume_rank", "fetched_at"
        from "fct_volume_analysis__dbt_tmp112028654424"
    )
  