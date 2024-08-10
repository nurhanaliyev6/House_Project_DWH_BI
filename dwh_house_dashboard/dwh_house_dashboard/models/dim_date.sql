
{{ config(
    materialized = 'table'
) }}

WITH date_data AS (
    SELECT DISTINCT
            ROW_NUMBER() OVER (ORDER BY "Tarix") AS tarix_id,
        "Tarix" AS tarix
    FROM {{ ref('house_data') }}
)
SELECT * FROM date_data
