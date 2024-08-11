{{ config(
    materialized = 'table',
    post_hook = ["DROP INDEX IF EXISTS idx_adres_id;",
    "CREATE INDEX idx_adres_id ON {{ this }} (adres_id);"]
) }}

WITH adres_data AS (
    SELECT DISTINCT
        "Adres" AS adres
    FROM {{ ref('house_data') }}
)
SELECT
 *, ROW_NUMBER() OVER (ORDER BY adres) AS adres_id

 FROM adres_data
