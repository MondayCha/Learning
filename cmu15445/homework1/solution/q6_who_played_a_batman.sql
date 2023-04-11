-- q6_who_played_a_batman
WITH batman_actors AS (
	SELECT
		DISTINCT(people.person_id) AS id,
		name
	FROM
		people
		INNER JOIN crew ON people.person_id = crew.person_id
	WHERE
		characters LIKE '%"Batman"%'
		AND category == "actor"
)
SELECT
	name,
	ROUND(AVG(rating), 2) as avg_rating
FROM
	ratings
	INNER JOIN crew ON ratings.title_id == crew.title_id
	INNER JOIN batman_actors ON crew.person_id == batman_actors.id
GROUP BY
	batman_actors.id
ORDER BY
	avg_rating DESC
LIMIT
	10;