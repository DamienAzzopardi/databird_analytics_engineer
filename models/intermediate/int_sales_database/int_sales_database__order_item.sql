with

order_data as (

    select
        oi.order_id,
        oi.order_item_id,
        oi.total_order_item_amount,
        oi.item_quantity,
        oi.product_id,
        o.user_id,
        o.order_status,
        o.order_created_at,
        o.order_approved_at
    
    from {{ ref('stg_sales_database__order_item') }} as oi

    inner join {{ ref('stg_sales_database__order') }} as o
        on oi.order_id = o.order_id

)

select * from order_data