{{
    config(materialized='table')
}}

with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),
addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses')}}
),
promos as (
    select * from {{ ref('slv_sql_server_dbo__promos')}}
),
enriched as (
    select
        o.*,
        a.* exclude (address_id, date_load),
        p.* exclude (promo_id , date_load)
    from orders o
    left join addresses a 
        on o.address_id = a.address_id
    left join promos p 
        on o.promo_id = p.promo_id
)

select * from enriched 
