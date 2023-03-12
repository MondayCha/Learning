-- q4_directors_in_each_decade
SELECT
	CAST(born / 10 * 10 AS TEXT) || 's' AS decade,
	COUNT(DISTINCT(people.person_id)) AS num_directors
FROM
	people
	INNER JOIN crew ON people.person_id = crew.person_id
WHERE
	born IS NOT NULL
	AND category == 'director'
	AND born >= 1900
GROUP BY
	decade
ORDER BY
	decade;