{% test created_before_processed(model, column_name) %}
    SELECT * FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    AND  created_at  > {{ column_name }}
{% endtest %}