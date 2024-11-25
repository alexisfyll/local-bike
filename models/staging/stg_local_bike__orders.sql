SELECT 
    order_id
    , customer_id
    , order_status
    , order_date
    , required_date
    , CASE WHEN shipped_date = 'NULL' THEN NULL ELSE DATE(shipped_date) END AS shipped_date
    , store_id
    , staff_id

FROM {{ source("local_bike", "orders") }}