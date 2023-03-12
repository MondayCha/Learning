-- q5_german_type_ratings
SELECT
	t.type,
	ROUND(AVG(r.rating), 2) AS avg_rating,
	MIN(r.rating),
	MAX(r.rating)
FROM
	akas as a
	INNER JOIN ratings as r ON r.title_id = a.title_id
	INNER JOIN titles as t ON t.title_id = a.title_id
WHERE
	a.language = 'de'
	AND (
		a.types = 'imdbDisplay'
		OR a.types = 'original'
	)
GROUP BY
	t.type
ORDER BY
	avg_rating;