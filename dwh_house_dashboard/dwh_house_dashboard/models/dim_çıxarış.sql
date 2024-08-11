{{ config(
    materialized = 'table',
    post_hook =[ "DROP INDEX IF EXISTS idx_çıxarış_id;",
    "CREATE INDEX idx_çıxarış_id ON {{ this }} (çıxarış_id);"]
) }}

WITH çıxarış_data AS (
    SELECT DISTINCT
            "Çıxarısh" AS çıxarış
    FROM {{ ref('house_data') }}
)
SELECT 
*, ROW_NUMBER() OVER (ORDER BY çıxarış) AS çıxarış_id

 FROM çıxarış_data
