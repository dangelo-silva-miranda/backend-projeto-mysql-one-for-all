CREATE VIEW `historico_reproducao_usuarios` AS
  SELECT
    U.FIRST_NAME `usuario`,
    S.TITLE `nome`
  FROM
    (SpotifyClone.`HISTORY` H
      INNER JOIN
    SpotifyClone.USERS U
    ON H.USER_ID = U.USER_ID)
      INNER JOIN
    SpotifyClone.SONGS S
    ON H.SONG_ID = S.SONG_ID
  ORDER BY
    `usuario`,
    `nome`;
