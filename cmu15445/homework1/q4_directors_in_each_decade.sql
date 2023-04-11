--passed--
SELECT decade || 's',
    COUNT(*)
FROM (
        SELECT DISTINCT(people.person_id),
            FLOOR(people.born / 10) * 10 AS decade
        FROM people
            INNER JOIN crew ON crew.person_id = people.person_id
        WHERE crew.category = 'director'
            AND people.born >= 1900
    )
GROUP BY decade
ORDER BY decade;