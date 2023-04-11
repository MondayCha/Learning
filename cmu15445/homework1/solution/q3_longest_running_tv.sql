-- q3_longest_running_tv
SELECT
	primary_title,
	CASE
		WHEN ended IS NOT NULL THEN ended - premiered
		ELSE 2023 - premiered
	END AS runtime
FROM
	titles
WHERE
	premiered NOT NULL
	AND type = 'tvSeries'
ORDER BY
	runtime DESC,
	primary_title ASC
LIMIT
	20;