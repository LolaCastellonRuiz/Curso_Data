
select
    {{ dbt_utils.star(from=ref('slv_sql_server_dbo__events') , except=['event_id'])}}
from {{ ref('slv_sql_server_dbo__events') }}