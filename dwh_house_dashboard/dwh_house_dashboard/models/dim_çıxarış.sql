{{ config(
    materialized = 'table'
) }}

WITH çıxarış_data AS (
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY "Çıxarısh") AS çıxarış_id,
        "Çıxarısh" AS çıxarış
    FROM {{ ref('house_data') }}
)
SELECT * FROM çıxarış_data
