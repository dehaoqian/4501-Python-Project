
SELECT rent.zipcode, rent.average_price
FROM 
    (SELECT zipcode, COUNT(tree_id) as tree_count
    FROM tree
    GROUP BY zipcode
    ORDER BY tree_count DESC
    LIMIT 10) as tree_count
JOIN 
    (SELECT zipcode, average_price
    FROM rent
    WHERE EXTRACT(MONTH FROM rent.date) = 8 AND EXTRACT(YEAR FROM rent.date) = 2023) as rent
ON tree_count.zipcode = rent.zipcode
ORDER BY tree_count.tree_count DESC;
