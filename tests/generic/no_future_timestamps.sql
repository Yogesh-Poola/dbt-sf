{% test no_future_timestamps(model, column_name) %}
    SELECT * FROM {{ model }}
    WHERE {{ column_name }} > CURRENT_TIMESTAMP()
{% endtest %}