SELECT 
    order_id || '-' || product_id as order_product_id
    , order_id
    , product_id
    , quantity
    , list_price
    , COALESCE(discount, 0) as discount

FROM {{ source("local_bike", "order_items") }}