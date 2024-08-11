{{ config(
    materialized = 'table',
    post_hook =  ["DROP INDEX IF EXISTS idx_mərtəbə_id;",

    "CREATE INDEX idx_mərtəbə_id ON {{ this }} (mərtəbə_id);"]
) }}

WITH mərtəbə_data AS (
    SELECT DISTINCT
        "Mertebe" AS mərtəbə,
        "Umumi Mertebe sayi" AS ümumi_mərtəbə_sayı
    FROM {{ ref('house_data') }}
)
SELECT 
* , row_number() over (order by mərtəbə,ümumi_mərtəbə_sayı) as mərtəbə_id
FROM mərtəbə_data
