{{
    config(
        materialized='table'
    ) 
}}

select
    neighbourhood_cleansed,
    room_type,
    count(id) as total_listings,
    avg(price) as avg_price,
from {{ ref('stg_airbnb__listings') }}
group by 1,2