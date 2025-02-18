with

favorite_product as (

    select
        user_id,
        product_id as favorite_product_id
    
    from {{ ref('int_sales_database__order_item') }}
    
    group by
        user_id,
        product_id
    
    qualify row_number() over (
        partition by user_id
        order by sum(item_quantity) desc
    ) = 1

)

select * from favorite_product
