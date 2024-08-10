{{ config(
    materialized = 'table'
) }}


WITH otaq_sayı_data AS (
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY "Otag sayı") AS otaq_sayı_id,
        "Otag sayı" AS otaq_sayı
    FROM {{ ref('house_data') }}
)
select * from otaq_sayı_data