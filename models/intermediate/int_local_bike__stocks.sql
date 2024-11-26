SELECT
  stk.stock_id  
  , str.store_name
  , p.product_id
  , p.product_name
  , stk.quantity
  , c.category_name
  , b.brand_name
  , p.list_price

FROM {{ ref("stg_local_bike__stocks" )}} stk

LEFT JOIN {{ ref("stg_local_bike__stores" )}} str
  ON stk.store_id = str.store_id

LEFT JOIN {{ ref("stg_local_bike__products" )}} p
  on stk.product_id = p.product_id

LEFT JOIN {{ ref("stg_local_bike__categories" )}} c
  ON c.category_id = p.category_id

LEFT JOIN {{ ref("stg_local_bike__brands" )}} b 
  ON b.brand_id = p.brand_id