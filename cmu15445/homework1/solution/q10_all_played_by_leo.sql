-- q10_all_played_by_leo
WITH json_table(json_data) AS (
	SELECT
		c.characters as json_data
	FROM
		people AS p,
		crew AS c
	WHERE
		p.name = "Leonardo DiCaprio"
		AND p.born = 1974
		AND p.person_id = c.person_id
	ORDER BY
		c.characters
),
characters(character) AS (
	SELECT
		DISTINCT value as character
	FROM
		json_table,
		json_each(json_table.json_data)
	WHERE
		character <> ""
		AND character NOT LIKE "%SELF%"
	ORDER BY
		character
)
SELECT
	GROUP_CONCAT(character)
FROM
	characters;