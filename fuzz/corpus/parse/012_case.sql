SELECT CASE WHEN status = 1 THEN 'active' WHEN status = 2 THEN 'pending' ELSE 'unknown' END FROM orders
