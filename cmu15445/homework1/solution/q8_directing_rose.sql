-- q8_directing_rose
WITH rose_titles AS (
	SELECT
		DISTINCT(c.title_id)
	FROM
		people AS p
		INNER JOIN crew AS c ON c.person_id = p.person_id
	WHERE
		category = 'actress'
		AND name LIKE 'Rose%'
),
rose_directors AS (
	SELECT
		DISTINCT(p.person_id)
	FROM
		people AS p
		INNER JOIN crew AS c ON c.person_id = p.person_id
	WHERE
		c.category = 'director'
		AND c.title_id IN rose_titles
)
SELECT
	name
FROM
	people AS p
	INNER JOIN rose_directors AS rd ON rd.person_id = p.person_id
ORDER BY
	name ASC;