{{
    config(
        materialized = 'table'
    )
}}

select 2*SEQUENCE AS multiplicationtwo from 
{{
    ref("seq")
}}
