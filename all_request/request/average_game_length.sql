SELECT AVG(max_step) AS avg_completed_game_length
FROM (
    SELECT game_id, MAX(number_step) AS max_step
    FROM steps
    WHERE game_id IN (
        SELECT game_id
        FROM games
    )
    GROUP BY game_id
) AS finished_games;