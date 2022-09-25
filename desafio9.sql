SELECT COUNT(history.music_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.user_history AS history
INNER JOIN SpotifyClone.users
ON history.user_id = users.user_id
where users.name = 'Barbara Liskov';