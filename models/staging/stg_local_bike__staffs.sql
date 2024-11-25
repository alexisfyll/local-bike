SELECT 
    staff_id
    , first_name
    , last_name
    , email
    , phone
    , active
    , store_id
    , CASE WHEN manager_id = 'NULL' THEN NULL ELSE manager_id END as manager_id

FROM {{ source("local_bike", "staffs") }}