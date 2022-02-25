SELECT 
	ROUND (MIN(S.plan_value),2) AS `faturamento_minimo`,
	ROUND (MAX(S.plan_value),2) AS `faturamento_maximo`,
	ROUND (AVG(S.plan_value),2) AS `faturamento_medio`,
	ROUND (SUM(S.plan_value),2) AS `faturamento_total`
FROM 
	SpotifyClone.subscriptions AS S
INNER JOIN 
	SpotifyClone.users AS U
    ON S.plan_id = U.plan_id;