{% macro greater_mco(num1,num2) %}

    {% if num1 > num2 %}
        '{{num1}} is greater than {{num2}}'
    {% else %}
        '{{num1}} is less than {{num2}}'
    {% endif %}

{% endmacro %}