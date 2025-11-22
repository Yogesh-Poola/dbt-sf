{% macro concat_t_mco(cols) %}
    {{ cols | join(" || ' ' || ") }}
{% endmacro %}