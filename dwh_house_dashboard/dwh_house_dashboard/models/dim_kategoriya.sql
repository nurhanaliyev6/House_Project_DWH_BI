{{ config(
    materialized = 'table',
    post_hook = [  "DROP INDEX IF EXISTS idx_kateqoriya_id;",

    "CREATE INDEX idx_kateqoriya_id ON {{ this }} (kateqoriya_id);"]
) }}

WITH kategoriya_data AS (
    SELECT DISTINCT
        "Kategoriya" AS kateqoriya
    FROM {{ ref('house_data') }}
)
SELECT 
*, ROW_NUMBER() OVER (ORDER BY kateqoriya) AS kateqoriya_id
FROM kategoriya_data
