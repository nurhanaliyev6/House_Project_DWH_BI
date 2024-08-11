{{ config(
    materialized = 'table',

) }}


WITH house_data AS (
    SELECT 
        ROW_NUMBER() OVER () AS house_id,
        d.tarix_id,
        k.kateqoriya_id,
        m.mərtəbə_id,
        o.otaq_sayı_id,
        c.çıxarış_id,
        a.adres_id,
        "Qiymet" AS qiymət,
        "Baxısh" AS baxış,
        "Elan" AS elan
    FROM {{ ref('house_data') }} h
    LEFT JOIN {{ ref('dim_date') }} d ON h."Tarix" = d.tarix
    LEFT JOIN {{ ref('dim_kategoriya') }} k ON h."Kategoriya" = k.kateqoriya
    LEFT JOIN {{ ref('dim_mərtəbə') }} m ON h."Mertebe" = m.mərtəbə AND h."Umumi Mertebe sayi" = m.ümumi_mərtəbə_sayı
    LEFT JOIN {{ ref('dim_otaq_sayı') }} o ON h."Otag sayı" = o.otaq_sayı
    LEFT JOIN {{ ref('dim_çıxarış') }} c ON h."Çıxarısh" = c.çıxarış
    LEFT JOIN {{ ref('dim_adres') }} a ON h."Adres" = a.adres
)
SELECT * FROM house_data
