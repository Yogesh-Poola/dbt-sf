{{
    config(
        query_tag = 'dbt',
        alias = 'sequence1to10'
    )
}}

SELECT SEQ4()+1 AS sequence FROM TABLE(GENERATOR(ROWCOUNT=>10))