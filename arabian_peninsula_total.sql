SELECT
    CAST(SUM(population) AS integer) AS total_population
FROM full_2020
WHERE month = '2019-06'
  AND country IN ('YEM', 'OMN', 'SAU')
  AND type = 'total_population';
