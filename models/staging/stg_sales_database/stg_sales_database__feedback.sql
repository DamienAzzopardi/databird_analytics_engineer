select
    concat(feedback_id, '_', order_id) as feedback_id,
    order_id,
    feedback_score,
    datetime(feedback_form_sent_date, "Europe/Paris") as feedback_form_sent_at,
    datetime(feedback_answer_date, "Europe/Paris") as feedback_answered_at,

from {{ source('sales_database', 'feedback') }}