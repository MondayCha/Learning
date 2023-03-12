--passed--
SELECT titles.type,
    ROUND(AVG(ratings.rating), 2) AS average,
    MIN(ratings.rating),
    MAX(ratings.rating)
FROM titles
    INNER JOIN akas ON titles.title_id = akas.title_id
    INNER JOIN ratings ON ratings.title_id = titles.title_id
WHERE akas.language = 'de'
    AND akas.types IN ('imdbDisplay', 'original')
GROUP BY titles.type
ORDER BY average;
-------------old version
-- SELECT tmp_titles.type,
--     ROUND(AVG(ratings.rating), 2) AS average,
--     MIN(ratings.rating),
--     MAX(ratings.rating)
-- FROM (
--         SELECT titles.title_id AS title_id,
--             titles.type AS type
--         FROM titles
--             INNER JOIN akas ON titles.title_id = akas.title_id
--         WHERE akas.language = 'de'
--             AND akas.types IN ('imdbDisplay', 'original')
--     ) AS tmp_titles
--     INNER JOIN ratings ON ratings.title_id = tmp_titles.title_id
-- GROUP BY tmp_titles.type
-- ORDER BY average;
--
-------------wrong version
-- SELECT tmp_titles.type,
--     ROUND(AVG(ratings.rating), 2) AS average,
--     MIN(ratings.rating),
--     MAX(ratings.rating)
-- FROM (
--         SELECT DISTINCT(titles.title_id) AS title_id,
--             titles.type AS type
--         FROM titles
--             INNER JOIN akas ON titles.title_id = akas.title_id
--         WHERE akas.language = 'de'
--             AND akas.types IN ('imdbDisplay', 'original')
--     ) AS tmp_titles
--     INNER JOIN ratings ON ratings.title_id = tmp_titles.title_id
-- GROUP BY tmp_titles.type
-- ORDER BY average;
-------------old version
-- SELECT titles.type,
--     COUNT(DISTINCT(titles.title_id))
-- FROM titles
--     INNER JOIN akas ON titles.title_id = akas.title_id
-- WHERE akas.language = 'de'
--     AND akas.types IN ('imdbDisplay', 'original')
-- GROUP BY titles.type;