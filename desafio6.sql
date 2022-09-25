SELECT FORMAT(MIN(plan.cost), 2) AS 'faturamento_minimo', MAX(plan.cost) AS 'faturamento_maximo', ROUND(AVG(plan.cost), 2) AS 'faturamento_medio', ROUND(SUM(plan.cost), 2) AS 'faturamento_total' FROM SpotifyClone.planos AS plan INNER JOIN SpotifyClone.user_assign AS assign ON assign.plano_id = plan.plano_id;