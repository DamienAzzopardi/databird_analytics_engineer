with

recent_listening as (

    select
        l.song_id,
        s.artist,
        l.minutes_listened
    
    from {{ ref('stg_spotify__listening_data') }} as l
    
    left join {{ ref('stg_spotify__songs') }} as s
        on l.song_id = s.song_id
    
    where listen_date >= date_sub(current_date(), interval 6 month)

),

artist_minutes as (

    select
        artist,
        sum(minutes_listened) as total_minutes_listened
    
    from recent_listening
    
    group by artist

)

select
    artist,
    total_minutes_listened

from artist_minutes

order by total_minutes_listened desc

--limit 10