SELECT CONCAT_WS('-', s1.from_step, s1.to_step, s2.from_step, s2.to_step) AS scenario,
       COUNT(*) AS count
FROM steps s1
INNER JOIN steps s2 ON s1.game_id = s2.game_id AND s1.number_step + 1 = s2.number_step
GROUP BY scenario
ORDER BY count DESC
LIMIT 5;