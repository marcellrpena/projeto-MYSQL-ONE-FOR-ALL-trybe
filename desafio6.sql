SELECT 
ROUND(MIN(cost), 2) AS faturamento_minimo, 
MAX(cost) AS faturamento_maximo, 
ROUND(AVG(plan.cost), 2) AS 'faturamento_medio', 
ROUND(SUM(plan.cost), 2) AS 'faturamento_total' 
FROM SpotifyClone.planos AS plan 
INNER JOIN SpotifyClone.users AS users 
ON users.plano_id = plan.plano_id;