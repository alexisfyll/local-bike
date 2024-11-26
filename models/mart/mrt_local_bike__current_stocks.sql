SELECT
    store_name
    , brand_name
    , category_name
    , CASE WHEN list_price < 500 THEN '0-500'
            WHEN list_price < 1000 THEN '500-1000'
            WHEN list_price < 1500 THEN '1000-1500'
            WHEN list_price < 2000 THEN '1500-2000'
            ELSE '>2000'
            END as list_price_bucket
    , SUM(quantity) as stock_volume

FROM {{ref("int_local_bike__stocks")}} stk

GROUP BY 1, 2, 3, 4