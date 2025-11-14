{% macro onlynum_mco(col) %}
    REGEXP_REPLACE({{col}},'[^0-9]','')
{% endmacro %}