SELECT data->>'name', data->'address'->>'city' FROM profiles WHERE data @> '{"active":true}'
