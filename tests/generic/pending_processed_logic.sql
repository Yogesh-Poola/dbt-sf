{% test pending_processed_logic(model, column_name) %}
    SELECT * FROM {{ model }}
    WHERE ( TRIM(UPPER(STATUS))='PENDING' AND {{ column_name }} IS NOT NULL )
       OR ( TRIM(UPPER(STATUS))='COMPLETED' AND {{ column_name }} IS NULL)
{% endtest %}