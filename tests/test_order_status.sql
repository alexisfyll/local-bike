SELECT 
    order_id
FROM {{ref('stg_local_bike__orders')}}

WHERE order_status <1 OR order_status > 4