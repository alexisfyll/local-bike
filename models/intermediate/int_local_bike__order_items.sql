SELECT
  oi.order_product_id
  , o.order_id
  , o.order_date
  , FORMAT_DATE('%Y-%m', o.order_date) AS order_month
  , o.required_date
  , o.shipped_date
  , p.product_name
  , b.brand_name
  , c.category_name
  , oi.quantity
  , oi.list_price as unit_list_price
  , oi.discount
  , ROUND((1 - oi.discount) * oi.list_price, 2) as unit_discounted_price
  , ROUND(oi.quantity * (1 - oi.discount) * oi.list_price, 2) as discounted_price
  , s.store_name


FROM {{ ref("stg_local_bike__order_items") }} oi
  
LEFT JOIN {{ ref("stg_local_bike__orders") }} o
    ON oi.order_id = o.order_id

LEFT JOIN {{ ref("stg_local_bike__products") }} p
  ON p.product_id = oi.product_id

LEFT JOIN {{ ref("stg_local_bike__categories") }} c
  ON c.category_id = p.category_id

LEFT JOIN {{ ref("stg_local_bike__brands") }} b
  ON b.brand_id = p.brand_id

LEFT JOIN {{ ref("stg_local_bike__stores") }} s
  on o.store_id = s.store_id

