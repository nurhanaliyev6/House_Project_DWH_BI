{{ config(
    materialized = 'table'
) }}

WITH adres_data AS (
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY "Adres") AS adres_id,
        "Adres" AS adres
    FROM {{ ref('house_data') }}
)
SELECT * FROM adres_data
