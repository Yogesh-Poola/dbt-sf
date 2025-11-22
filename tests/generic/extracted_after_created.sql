{% test extracted_after_created(model, column_name) %}
    SELECT * FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    AND {{ column_name }}  <  created_at 
{% endtest %}