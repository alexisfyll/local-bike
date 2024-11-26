SELECT
    product_id || '-' ||  store_id as stock_id
    , store_id
    , product_id
    , quantity

FROM {{ source("local_bike", "stocks") }}