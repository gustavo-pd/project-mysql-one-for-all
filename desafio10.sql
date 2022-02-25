SELECT
  T.name AS nome,
  COUNT(H.user_id) AS reproducoes
FROM SpotifyClone.user_historic AS H
JOIN SpotifyClone.tracks AS T
  ON H.track_id = T.track_id
JOIN SpotifyClone.users AS U
  ON U.user_id = H.user_id
JOIN SpotifyClone.subscriptions AS S
  ON S.plan_id = U.plan_id
WHERE S.plan_name = 'gratuito' OR S.plan_name = 'pessoal'
GROUP BY T.name
ORDER BY T.name;