-- q9_ode_to_death
WITH longest_per_person AS (
	SELECT
		category,
		name,
		died,
		primary_title,
		runtime_minutes,
		DENSE_RANK() OVER (
			PARTITION BY c.category
			ORDER BY
				p.died ASC,
				p.name ASC
		) AS rank_num,
		DENSE_RANK() OVER (
			PARTITION BY c.category,
			c.person_id
			ORDER BY
				runtime_minutes DESC,
				t.title_id ASC
		) AS rank_num_runtime
	FROM
		crew AS c
		INNER JOIN people as p ON p.person_id = c.person_id
		INNER JOIN titles as t ON c.title_id = t.title_id
	WHERE
		p.died NOT NULL
		AND runtime_minutes NOT NULL
),
top_titles AS (
	SELECT
		category,
		name,
		died,
		primary_title,
		runtime_minutes,
		rank_num
	FROM
		longest_per_person as lpp
	WHERE
		rank_num <= 5
		AND rank_num_runtime = 1
)
SELECT
	*
FROM
	top_titles
ORDER BY
	category ASC,
	rank_num ASC;