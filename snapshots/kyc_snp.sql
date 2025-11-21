{% snapshot kyc_snp %}
    {{
        config(
            target_schema='SNP_SC',
            target_database='SNP_DB',
            unique_key='CUSTOMER_ID',
            strategy='check',
            invalidate_hard_deletes=True,
            check_cols=['CUSTOMER_ID','FULL_NAME','PHONE','ADDRESS','PAN','KYC_STATUS']
        )
    }}

    select * from {{ source('default_source', 'CUSTOMER_KYC') }}
 {% endsnapshot %}