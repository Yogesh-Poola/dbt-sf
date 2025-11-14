{{
    config(
        materialized = 'view',
        query_tag = 'dbt'
    )
}}

SELECT * FROM CHROMA.STG.STG_SALES_JSON