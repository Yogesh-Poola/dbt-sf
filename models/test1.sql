{{
    config(
        materialized='table',
        transient=false,
        pre_hook=["USE WAREHOUSE {{var('vwh_xs1')}}"],
        schema= 'DBT1_SC',
        query_tag= 'dbt_run'
    )
}}
select * from {{ source('sf_sample_db', 'ORDERS') }}
where O_ORDERSTATUS = {{ var('orderstatus') }}