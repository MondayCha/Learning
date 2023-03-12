--passed--
SELECT premiered,
    primary_title || ' (' || original_title || ')'
FROM titles
WHERE primary_title <> original_title
    AND genres like '%Action%'
    AND type = 'movie'
ORDER BY premiered DESC,
    primary_title
LIMIT 10;