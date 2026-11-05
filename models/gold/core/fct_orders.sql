--- ===========================================================
--- fct_orders: pedidos con el descuento de la promo aplicada 
--- Granularidad: una fila por pedido
--- ============================================================

with orders as(
    select * from {{ ref('slv_sql_server_dbo__orders')}}
),
promos as (
    select * from {{ ref('slv_sql_server_dbo__promos')}}
),
final as (
    select 
          o.order_id
        , o.user_id
        , o.address_id
        , o.promo_id
        , o.shipping_service
        , o.tracking_id
        , o.shipping_cost
        , o.order_cost 
        , o.total_order_cost_usd
        , coalesce(p.discount_usd,0) as promo_discount
        , o.created_at_utc as order_created_at_utc
        , o.estimated_delivery_at
        , o.delivered_at as delivered_at_utc
        , o.date_load

    from orders o
    left join promos p 
        on o.promo_id = p.promo_id
 )

 select * from final