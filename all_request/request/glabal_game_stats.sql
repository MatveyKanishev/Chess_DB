SELECT g.result_game, COUNT(*) AS occurrences
FROM games g
GROUP BY g.result_game
ORDER BY occurrences DESC;