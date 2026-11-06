-- =========================================================
-- Test Singular: devuelve los pedidos sin ninguna linea 
-- Une fct_orders con fct_order_items 
-- ==========================================================

{{
    config(
        severity='warn'
    )
}}


with orders as(
    select * from {{ref('fct_orders')}}
),
items as(
    select * from {{ref('fct_order_items')}}
)
select
      o.* ,
      i.*
from orders o 
left join items i 
    on o.order_id = i.order_id
where i.order_item_id IS NULL


