SELECT tracks.name AS nome,
	COUNT(*) AS reproducoes
FROM user_historic AS H
JOIN tracks AS T
	ON H.track_id = T.track_id
JOIN users AS U
	ON U.plan_id = 1 OR U.plan_id = 4
GROUP BY T.name
ORDER BY T.name;