{{ config(materialized='table') }}
-- a dimesnsion table — one row per unique coin containing its static descriptive attributes. 
-- containing the descriptive data only

with source as (
    Select * from {{ ref('stg_coin_prices')}}
)

, final as (
    Select distinct coin_id, symbol, name
    from source
)

Select * from final