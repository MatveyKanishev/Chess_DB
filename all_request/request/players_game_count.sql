SELECT u.username, COUNT(g.game_id) AS num_games
FROM users u
INNER JOIN games g ON u.user_id = g.user_white_id OR u.user_id = g.user_black_id
GROUP BY u.user_id
ORDER BY num_games DESC;