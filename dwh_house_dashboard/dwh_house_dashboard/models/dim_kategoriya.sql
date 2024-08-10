{{ config(
    materialized = 'table'
) }}

WITH kategoriya_data AS (
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY "Kategoriya") AS kateqoriya_id,
        "Kategoriya" AS kateqoriya
    FROM {{ ref('house_data') }}
)

-- Final SELECT statement
SELECT * FROM kategoriya_data
