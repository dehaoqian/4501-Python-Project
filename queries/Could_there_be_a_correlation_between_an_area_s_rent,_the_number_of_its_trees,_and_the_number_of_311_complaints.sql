
SELECT unorder_base_rent.zipcode, unorder_base_rent.average_price, base_tree.tree_count, base_complaint.complaint_count
FROM 
    (
		SELECT unorder_base_rent.zipcode, unorder_base_rent.average_price FROM (
			(SELECT rent.zipcode, rent.average_price 
			FROM rent 
			JOIN tree ON rent.zipcode = tree.zipcode
			WHERE average_price != 'NaN' AND state = 'NY' AND EXTRACT(MONTH FROM rent.date) = 1 AND EXTRACT(YEAR FROM rent.date) = 2023
			GROUP BY rent.zipcode, rent.average_price
			HAVING COUNT(tree.zipcode) > 0
			ORDER BY rent.average_price DESC
			LIMIT 5)
			UNION
			(SELECT rent.zipcode, rent.average_price 
			FROM rent 
			JOIN tree ON rent.zipcode = tree.zipcode
			WHERE average_price != 'NaN' AND state = 'NY' AND EXTRACT(MONTH FROM rent.date) = 1 AND EXTRACT(YEAR FROM rent.date) = 2023
			GROUP BY rent.zipcode, rent.average_price
			HAVING COUNT(tree.zipcode) > 0
			ORDER BY rent.average_price ASC 
			LIMIT 5)
		) AS unorder_base_rent
    ) AS unorder_base_rent
LEFT JOIN 
    (
        SELECT tree.zipcode, COUNT(tree.tree_id) AS tree_count
        FROM tree
        GROUP BY  tree.zipcode
    ) AS base_tree
ON unorder_base_rent.zipcode = base_tree.zipcode
JOIN
    (
        SELECT complaint.zipcode, COUNT(complaint.unique_key) AS complaint_count
        FROM complaint
        GROUP BY complaint.zipcode
    ) AS base_complaint
ON unorder_base_rent.zipcode = base_complaint.zipcode
ORDER BY unorder_base_rent.average_price DESC;

