SELECT
	T.name AS nome,
    COUNT(H.user_id) AS reproducoes
FROM
	SpotifyClone.tracks AS T
    JOIN SpotifyClone.user_historic AS H
		ON T.track_id = H.track_id
	JOIN SpotifyClone.users AS U
		ON U.user_id = H.user_id
	JOIN SpotifyClone.subscriptions AS S
		ON S.plan_id = U.plan_id
WHERE
	S.plan_name IN('gratuito', 'pessoal')
GROUP BY nome;