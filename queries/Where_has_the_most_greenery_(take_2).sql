
SELECT zipcode, COUNT(tree_id)
FROM (
	SELECT *
	FROM 
		(SELECT * FROM tree) as base_tree
	JOIN 
		(SELECT geometry FROM zipcode) as base_zipcode
	ON ST_Contains(base_zipcode.geometry, base_tree.geometry)
)
GROUP BY zipcode
ORDER BY count DESC
LIMIT 10;

