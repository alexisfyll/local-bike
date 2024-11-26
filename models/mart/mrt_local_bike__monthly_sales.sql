SELECT 
    order_month
    , order_trunc_month
    , category_name
    , brand_name
    , store_name
    , SUM(quantity) as quantity
    , SUM(discounted_price) as total_sales_amount
    , SUM(unit_list_price*quantity) as total_listed_price
    , SUM(discounted_price) / SUM(unit_list_price*quantity) as discount
    
    
FROM {{ ref("int_local_bike__order_items")}}

GROUP BY 1,2,3,4,5