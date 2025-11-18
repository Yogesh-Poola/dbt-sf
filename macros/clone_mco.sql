{% macro clone_t_mco(trg_db, trg_sc, src_db, src_sc, tables, preview=false) %}

    {% set create_db%}
        CREATE TRANSIENT DATABASE IF NOT EXISTS {{trg_db}}
    {% endset %}

    {% set create_sc%}
        CREATE TRANSIENT SCHEMA IF NOT EXISTS {{trg_sc}}
    {% endset %}

    {% if preview %}
        {{ log("PREVIEW MODE. No SQL Executed" ~ create_db,info=TRUE) }}
        {{ log("PREVIEW MODE. No SQL Executed" ~ create_sc,info=TRUE) }}
    {% else %}
        {% do run_query(create_db) %}
        {% do run_query(create_sc) %}
    {% endif %}

    {% for t in tables%}
        {% set target_t= trg_db ~ "." ~ trg_sc ~ "." ~ t~"_clone" %}
        {% set source_t= src_db ~ "." ~ src_sc ~ "." ~t %}
        {% set clone_t%}
            CREATE TABLE {{ target_t }} CLONE {{ source_t }}
        {% endset %}
        {% if preview %}
            {{ log("PREVIEW MODE. No SQL Executed" ~ clone_t, info=TRUE)}}
        {% else %}
            {% do run_query(clone_t) %}
        {% endif %}

    {% endfor %}

{% endmacro %}