--passed--
WITH title_ids AS (
    SELECT c.title_id AS title_id
    FROM crew AS c
        INNER JOIN people AS p ON p.person_id = c.person_id
    WHERE p.name like 'Rose%'
        AND c.category = 'actress'
)
SELECT DISTINCT(p.name) AS name
FROM title_ids AS t
    INNER JOIN crew AS c ON t.title_id = c.title_id
    INNER JOIN people AS p ON p.person_id = c.person_id
WHERE c.category = 'director'
ORDER BY name;
/*
 SELECT p.name
 FROM crew AS c
 INNER JOIN people AS p ON p.person_id = c.person_id
 WHERE p.name like 'Rose%'
 AND c.category = 'actress'
 AND p.name NOT LIKE 'Rose %'