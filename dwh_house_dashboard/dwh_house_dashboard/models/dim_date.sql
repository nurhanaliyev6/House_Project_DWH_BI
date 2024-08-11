{{ config(
    materialized = 'table',
    post_hook = ["DROP INDEX IF EXISTS idx_tarix_id;",
    "CREATE INDEX idx_tarix_id ON {{ this }} (tarix_id);"]
) }}

WITH date_data AS (
    SELECT DISTINCT
        "Tarix" AS tarix
    FROM {{ ref('house_data') }}
)
SELECT
 *, ROW_NUMBER() OVER (ORDER BY tarix) AS tarix_id
 FROM date_data
