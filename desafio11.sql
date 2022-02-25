SELECT name AS nome_musica,
  CASE
    WHEN name LIKE '%Streets%' THEN REPLACE(name, 'Streets', 'Code Review')
	  WHEN name LIKE '%Silly%' THEN REPLACE(name, 'Silly', 'Nice')
    WHEN name LIKE '%Circus%' THEN REPLACE(name, 'Circus', 'Pull Request')
    WHEN name LIKE '%Her Own%' THEN REPLACE(name, 'Her Own', 'Trybe')
    WHEN name LIKE '%Inner Fire%' THEN REPLACE(name, 'Inner Fire', 'Project')
  END AS novo_nome
FROM SpotifyClone.tracks
  HAVING novo_nome IS NOT NULL
  ORDER BY novo_nome;