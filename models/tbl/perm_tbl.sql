{{
    config(
        materialized = 'table',
        transient = false
    )
}}

SELECT *, (price * quantity) AS totalprice FROM {{ref("secure_view")}}