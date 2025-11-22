{% macro row_count_mco(tbl) %}
    {% set cnt %}
    SELECT count(*) from {{tbl}}
    {% endset %}
{% endmacro %}