-- Generate generation column
WITH GenGrouped AS (
    SELECT
        Gender,
        CASE
            WHEN EXTRACT(YEAR FROM DateOfBirth) BETWEEN 1965 AND 1980 THEN 'Gen X'
            WHEN EXTRACT(YEAR FROM DateOfBirth) BETWEEN 1981 AND 1996 THEN 'Millennials'
            WHEN EXTRACT(YEAR FROM DateOfBirth) BETWEEN 1997 AND 2012 THEN 'Gen Z'
            WHEN EXTRACT(YEAR FROM DateOfBirth) >= 2013 THEN 'Gen Alpha'
            ELSE 'Other'
        END AS Generation
    FROM Campers
)
SELECT
    Generation,
    SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS MaleCount,
    SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS FemaleCount
FROM GenGrouped
GROUP BY Generation
ORDER BY Generation;
