--- ====================================================
--- dim_users: ususarios enriquecidos con su direccion
--- ====================================================

with users as (
    select * from {{ ref('slv_sql_dbo__users')}}
),
addresses as (
    select* from {{ ref('dim_addresses')}}
),
final as (
    select
         u.user_id
        , u.first_name
        , u.last_name
        , u.email
        , u.phone_number
        , u.address_id
        , ad.address_line
        , ad.zipcode
        , ad.state
        , ad.country
        , ad.country_code
        , ad.continent
        , u.created_at_utc
        , u.updated_at
        , u.date_load
    from users u 
    left join addresses ad 
        on u.address_id = ad.address_id      
)
select * from final 