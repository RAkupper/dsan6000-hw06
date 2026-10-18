WITH mapping(type,population,former_country) AS(
SELECT
  type,
  population,
  CASE
    WHEN adm1 IN (
        'Al Bayda''', 'Sana''a', 'Al Dali''',
        'Al Hudaydah', 'Al Jawf', 'Al Mahwit',
        'Amanat Al Asimah', 'Amran', 'Dhamar',
        'Hajjah', 'Ibb', 'Ma''rib', 'Raymah',
        'Sa''dah', 'Ta''izz'
    ) THEN 'YAR'
    WHEN adm1 IN (
        'Aden', 'Abyan', 'Al Mahrah',
        'Hadramawt', 'Lahij', 'Shabwah'
    ) THEN 'PDRY'
    ELSE NULL
  END AS former_country
FROM yemen_2020
WHERE type in ('youth_15_24','elderly_60_plus')
)

SELECT
  type,
  former_country,
  cast(sum(population) as integer) AS population
FROM mapping
WHERE former_country IS NOT NULL
GROUP BY type,former_country
ORDER BY type,former_country;
