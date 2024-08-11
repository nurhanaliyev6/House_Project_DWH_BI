{{ config(
    materialized = 'table',
    post_hook =[ "DROP INDEX IF EXISTS idx_otaq_sayı_id;",
    "CREATE INDEX idx_otaq_sayı_id ON {{ this }} (otaq_sayı_id);"]
) }}

WITH otaq_sayı_data AS (
    SELECT DISTINCT
        "Otag sayı" AS otaq_sayı
    FROM {{ ref('house_data') }}
)
SELECT 
*, ROW_NUMBER() OVER (ORDER BY otaq_sayı) AS otaq_sayı_id
FROM otaq_sayı_data
