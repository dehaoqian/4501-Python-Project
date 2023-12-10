
SELECT zipcode, COUNT(tree_id)
FROM tree
GROUP BY zipcode
ORDER BY count DESC
LIMIT 10;
