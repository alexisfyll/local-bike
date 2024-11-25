SELECT 
    order_id || '-' || product_id as order_product_id
    , order_id
    , product_id
    , quantity
    , list_price
    , discount

FROM {{ source("local_bike", "order_items") }}