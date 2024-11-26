SELECT 
    order_month
    , order_trunc_month
    , category_name
    , brand_name
    , store_name
    , CASE WHEN unit_list_price < 500 THEN '0-500'
            WHEN unit_list_price < 1000 THEN '500-1000'
            WHEN unit_list_price < 1500 THEN '1000-1500'
            WHEN unit_list_price < 2000 THEN '1500-2000'
            ELSE '>2000'
            END as list_price_bucket
    , SUM(quantity) as quantity
    , SUM(discounted_price) as total_sales_amount
    , SUM(unit_list_price*quantity) as total_listed_price
    , SUM(discounted_price) / SUM(unit_list_price*quantity) as discount
    
    
FROM {{ ref("int_local_bike__order_items")}}

GROUP BY 1,2,3,4,5,6