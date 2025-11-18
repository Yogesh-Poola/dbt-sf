{% macro sum_mco(nums) %}
    {% set ns = namespace(sum = 0) %}
    {% for item in nums %}
        {% set ns.sum = ns.sum + item %}
    {% endfor %}
    {{ return(ns.sum) }}
{% endmacro %}