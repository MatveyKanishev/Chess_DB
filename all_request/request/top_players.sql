SELECT u.username,
       SUM( CASE WHEN (u.user_id = g.user_white_id and g.result_game = 'white') THEN 1 ELSE 0 END) +
       SUM(CASE WHEN (u.user_id = g.user_black_id and g.result_game = 'black') THEN 1 ELSE 0 END) +
       SUM(CASE WHEN g.result_game = 'draw' THEN 0.5 ELSE 0 END) AS points
FROM users u
INNER JOIN games g ON u.user_id = g.user_white_id OR u.user_id = g.user_black_id
GROUP BY u.user_id
ORDER BY points DESC
LIMIT 5;