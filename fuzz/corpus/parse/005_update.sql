UPDATE users SET active = false WHERE last_login < NOW() - INTERVAL '90 days'
