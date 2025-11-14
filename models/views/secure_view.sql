{{
    config(
        materialized = 'view',
        secure = true

    )
}}

SELECT RAW:customer:id::NUMBER AS ID,
       RAW:customer:tier::VARCHAR AS TIER,
       eachitem.value:productId::NUMBER AS productid,
       eachitem.value:price::FLOAT AS price,
       eachitem.value:qty::NUMBER AS quantity
FROM {{ref("normal_view")}},
LATERAL FLATTEN(INPUT=>RAW:items) AS eachitem