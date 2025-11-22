{% macro cleanup1_mco(col) %}
    CASE
        WHEN {{col}}='' THEN NULL
        ELSE TRIM({{col}})
    END
{% endmacro %}