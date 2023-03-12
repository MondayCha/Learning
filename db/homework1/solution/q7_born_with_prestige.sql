-- q7_born_with_prestige
SELECT
	COUNT(DISTINCT people.person_id)
FROM
	people
	INNER JOIN crew ON people.person_id == crew.person_id
WHERE
	born IN (
		SELECT
			premiered
		FROM
			titles
		WHERE
			primary_title == "The Prestige"
	)
	AND (
		category == "actor"
		OR category == "actress"
	)
ORDER BY
	name;