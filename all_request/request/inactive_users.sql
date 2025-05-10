SELECT u.username
FROM users u
WHERE NOT EXISTS (
  SELECT 1
  FROM games g
  WHERE (g.user_white_id = u.user_id OR g.user_black_id = u.user_id) AND g.ended_at >= NOW() - INTERVAL '3 year'
);