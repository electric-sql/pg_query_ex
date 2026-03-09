SELECT id FROM admins UNION ALL SELECT id FROM moderators EXCEPT SELECT id FROM banned_users
