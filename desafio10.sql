SELECT music.name AS nome, COUNT(history.user_id) AS reproducoes
FROM SpotifyClone.user_history AS history
INNER JOIN SpotifyClone.musics AS music
ON history.music_id = music.music_id
INNER JOIN SpotifyClone.users
ON history.user_id = users.user_id
where users.plano_id = 1 OR users.plano_id = 4
GROUP BY music.name
ORDER BY music.name;