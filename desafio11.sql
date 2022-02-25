SELECT 
T.name AS nome_musica,
	CASE
		WHEN name LIKE '%Streets%' THEN REPLACE(name, 'Streets', 'Code Review')
		WHEN name LIKE '%Her Own%' THEN REPLACE(name, 'Her Own', 'Trybe')
		WHEN name LIKE '%Inner Fire%' THEN REPLACE(name, 'Inner Fire', 'Project')
		WHEN name LIKE '%Silly%' THEN REPLACE(name, 'Silly', 'Nice')
		WHEN name LIKE '%Circus%' THEN REPLACE(name, 'Circus', 'Pull Request')
END AS novo_nome
FROM SpotifyClone.tracks AS T
	HAVING NOT novo_nome IS NULL
	ORDER BY novo_nome;