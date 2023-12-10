SELECT tree_id, spc_common, health, status, ST_AsText(geometry)
FROM tree
WHERE ST_DWithin(
    geometry::geography,
    ST_GeomFromText('POINT(-73.96253174434912 40.80737875669467)', 4326)::geography,
    0.5 * 1609.34
)
LIMIT 10;