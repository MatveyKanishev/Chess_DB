SELECT u.username, COUNT(f.friend_id) AS friend_count
FROM users u
INNER JOIN friends f ON u.user_id = f.user_id
GROUP BY u.user_id, u.username
ORDER BY friend_count DESC
LIMIT 5;