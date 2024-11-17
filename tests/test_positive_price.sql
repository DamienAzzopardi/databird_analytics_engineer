select *
from {{ ref('stg_listings') }}
where price <= 0