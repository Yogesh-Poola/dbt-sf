{% macro create_mview_mco(trg,src) %}
    {% set query_text %}
        CREATE MATERIALIZED VIEW {{trg}}
        AS
        SELECT * FROM {{src}}
    {% endset %}
    {% do run_query(query_text) %}
{% endmacro %}