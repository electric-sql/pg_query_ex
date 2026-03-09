WITH recent AS (SELECT * FROM events WHERE created_at > NOW() - INTERVAL '1 hour') SELECT count(*) FROM recent
