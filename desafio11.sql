SELECT music.name AS nome_musica,(
CASE
	WHEN music.name LIKE '%Bard%' THEN REPLACE(music.name, 'Bard', 'QA')
	WHEN music.name LIKE '%Amar%' THEN REPLACE(music.name, 'Amar', 'Code Review')
	WHEN music.name LIKE '%Pais%' THEN REPLACE(music.name, 'Pais', 'Pull Requests')
	WHEN music.name LIKE '%SOUL%' THEN REPLACE(music.name, 'SOUL', 'CODE')
	WHEN music.name LIKE '%SUPERSTAR%' THEN REPLACE(music.name, 'SUPERSTAR', 'SUPERDEV')
END) AS novo_nome
FROM SpotifyClone.musics AS music
HAVING novo_nome <> 'null'
ORDER BY music.name DESC;