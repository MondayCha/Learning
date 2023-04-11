-- q2_not_the_same_title
select
	premiered,
	primary_title || " (" || original_title || ")"
from
	titles
where
	primary_title <> original_title
	and type == 'movie'
	and genres like '%Action%'
order by
	premiered desc,
	primary_title asc
limit
	10;