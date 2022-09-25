SELECT art.name AS artista, album.name AS album
FROM SpotifyClone.albuns AS album
INNER JOIN SpotifyClone.artist AS art
ON album.artist_id = art.artist_id
GROUP BY album.name
HAVING art.name = 'Elis Regina';