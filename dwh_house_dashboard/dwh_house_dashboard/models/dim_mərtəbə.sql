-- models/dim_mərtəbə.sql
{{ config(
    materialized = 'table'
) }}

WITH mərtəbə_data AS (
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY "Mertebe") AS mərtəbə_id,
        "Mertebe" AS mərtəbə,
        "Umumi Mertebe sayi" AS ümumi_mərtəbə_sayı
    FROM {{ ref('house_data') }}
)

select * from mərtəbə_data

