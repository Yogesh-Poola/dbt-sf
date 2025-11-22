{{ config(
    materialized='table',
    transient=false,
    schema='SILVER',
    query_tag='dbt_run_transactions'
) }}

SELECT
    R.*,
    
    -- Reason Code
    CASE
        WHEN R.TRANSACTION_ID IS NULL THEN 'missing_transaction_id'
        WHEN R.CUSTOMER_ID IS NULL THEN 'missing_customer_id'
        WHEN TRY_TO_DECIMAL(R.AMOUNT,18,2) <= 0 THEN 'invalid_amount'
        WHEN TRIM(UPPER(R.CURRENCY)) NOT IN ('USD','INR','EUR') THEN 'invalid_currency'
        WHEN TRY_TO_TIMESTAMP_NTZ(R.CREATED_AT) > CURRENT_TIMESTAMP() THEN 'future_created_at'
        WHEN R.STATUS = 'COMPLETED' AND R.PROCESSED_AT IS NULL THEN 'completed_missing_processed'
        WHEN R.STATUS = 'PENDING' AND R.PROCESSED_AT IS NOT NULL THEN 'pending_has_processed'
        WHEN TRY_TO_TIMESTAMP_NTZ(R.PROCESSED_AT) > CURRENT_TIMESTAMP() THEN 'future_processed_at'
        WHEN TRY_TO_TIMESTAMP_NTZ(R.EXTRACTED_AT) < TRY_TO_TIMESTAMP_NTZ(R.CREATED_AT) THEN 'extracted_before_created'
        ELSE 'unknown_error'
    END AS error_reason

FROM {{ source('medallion', 'transactions_raw') }} R

LEFT JOIN {{ ref('transactions') }} S
    ON S.transaction_id = R.transaction_id

WHERE S.transaction_id IS NULL
