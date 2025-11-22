{% snapshot cust_snp %}
    {{
        config(
            target_schema='SNP_SC',
            target_database='SNP_DB',
            unique_key='CUSTOMER_ID',
            strategy='timestamp',
            invalidate_hard_deletes=True,
            updated_at='updated_at'
        )
    }}

    select * from {{ source('default_source', 'CUSTOMER') }}
 {% endsnapshot %}