CREATE VIEW cancoes_premium AS
  SELECT
    S.TITLE `nome`,
    COUNT(S.TITLE)
  FROM
    ((SpotifyClone.`HISTORY` H
      INNER JOIN
    SpotifyClone.SONGS S
    ON H.SONG_ID = S.SONG_ID)
      INNER JOIN
    SpotifyClone.USERS U
    ON H.USER_ID = U.USER_ID)
      INNER JOIN
    SpotifyClone.PLANS P
    ON U.PLAN_ID = P.PLAN_ID
  WHERE
    P.TYPE IN ('familiar','universitário')
  GROUP BY
    `nome`
  ORDER BY
    `nome`;
