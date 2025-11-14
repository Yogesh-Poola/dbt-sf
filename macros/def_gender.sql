{% macro m_gender(col) %}
    CASE
        WHEN {{col}}='M' THEN 'MALE'
        WHEN {{col}}='F' THEN 'FEMALE'
        ELSE 'NA'
    END
{% endmacro %}