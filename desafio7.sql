SELECT art.name AS artista, album.name AS album, COUNT(followers.user_follower) AS seguidores
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.albuns AS album
ON art.artist_id = album.artist_id
INNER JOIN SpotifyClone.followers
ON art.artist_id = followers.artist_followed
GROUP BY album.name
ORDER BY seguidores desc, art.name, album.name;