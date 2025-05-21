with
    cleaned_listening_data as (

        select
            song_id,
            cast(listen_date as date) as listen_date,
            coalesce(minutes_listened, 0) as minutes_listened

        from {{ source("spotify", "listening_data") }}

    )

select *
from cleaned_listening_data
