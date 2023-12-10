
SELECT zipcode, COUNT(unique_key)
FROM complaint
WHERE created_date >= '2022-10-01' AND created_date <= '2023-09-30' AND zipcode != -1
GROUP BY zipcode
ORDER BY count DESC
LIMIT 10;
