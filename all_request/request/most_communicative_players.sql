SELECT m.user_from_id, COUNT(*) AS conversation_length
FROM messages m
GROUP BY m.user_from_id
ORDER BY conversation_length DESC
LIMIT 5;