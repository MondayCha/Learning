--passed--
SELECT COUNT(DISTINCT(p.person_id))
FROM people AS p
    INNER JOIN crew AS c ON p.person_id = c.person_id
WHERE c.category IN ('actor', 'actress')
    AND p.born IN (
        SELECT premiered
        FROM titles
        WHERE primary_title = 'The Prestige'
    );