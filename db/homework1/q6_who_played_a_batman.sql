--passed--
WITH actors AS (
    SELECT DISTINCT(crew.person_id) AS person_id,
        people.name AS person_name
    FROM crew
        INNER JOIN people ON people.person_id = crew.person_id
    WHERE crew.characters LIKE '%"Batman"%'
        AND crew.category = "actor"
)
SELECT a.person_name,
    ROUND(AVG(rating), 2) AS average
FROM actors AS a
    INNER JOIN crew AS c ON c.person_id = a.person_id
    INNER JOIN ratings AS r ON c.title_id = r.title_id -- WHERE c.category = "actor"
GROUP BY a.person_id
ORDER BY average DESC
LIMIT 10;