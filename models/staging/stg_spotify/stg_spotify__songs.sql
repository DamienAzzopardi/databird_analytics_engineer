with
    cleaned_songs as (

        select
            song_id,
            upper(title) as title,
            upper(artist) as artist,
            album,
            release_year,
            coalesce(genre, 'Unknown') as genre

        from {{ source("spotify", "songs") }}

    )

select *
from cleaned_songs
