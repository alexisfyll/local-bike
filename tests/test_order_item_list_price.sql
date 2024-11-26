SELECT 
    order_product_id

from {{ref("stg_local_bike__order_items")}}

WHERE list_price <0