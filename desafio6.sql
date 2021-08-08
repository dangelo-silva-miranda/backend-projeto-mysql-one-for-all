CREATE VIEW `faturamento_atual` AS
  SELECT
    ROUND(MIN(P.PRICE), 2) `faturamento_minimo`,
    ROUND(MAX(P.PRICE), 2) `faturamento_maximo`,
    ROUND(AVG(P.PRICE), 2) `faturamento_medio`,
    ROUND(SUM(P.PRICE), 2) `faturamento_total`
  FROM
    SpotifyClone.USERS U
      INNER JOIN
    SpotifyClone.PLANS P
    ON U.PLAN_ID = P.PLAN_ID;
