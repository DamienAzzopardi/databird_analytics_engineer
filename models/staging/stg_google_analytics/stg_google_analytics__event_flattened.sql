{{ 
    config(
        cluster_by= 'event_name',
    ) 
}}
 
select
    event_name,
    timestamp_micros(event_timestamp) as event_timestamp,
    user_pseudo_id,
    user_first_touch_timestamp,
    (select event_params.value.int_value from unnest(event_params) event_params where event_params.key = 'ga_session_id') as ga_session_id,
    (select event_params.value.string_value from unnest(event_params) event_params where event_params.key = 'page_title') as page_title,
    (select event_params.value.string_value from unnest(event_params) event_params where event_params.key = 'browser') as browser,
    traffic_source.medium as traffic_medium,
    traffic_source.source as traffic_source,
    traffic_source.name as traffic_name

from {{ source('google_analytics', 'events_2021_01_01_05') }}