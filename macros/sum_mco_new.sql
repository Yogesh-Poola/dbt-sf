{% macro sum_mco_new(cols) %}
    {{ return( cols | sum ) }}
{% endmacro %}