{{
    config(
        tag='daily'
    ) 
}}

with neighbourhood_prices as (

    select
        neighbourhood_cleansed,
        room_type,
        count(id) as total_listings,
        round(avg(price),2) as avg_price

    from {{ ref('stg_airbnb__listings') }}

    group by 1, 2

)

select * from neighbourhood_prices