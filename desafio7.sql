CREATE VIEW `perfil_artistas` AS
  SELECT
    AR.FULL_NAME `artista`,
    AL.TITLE `album`,
    COUNT(F.USER_ID) `seguidores`
  FROM
    (SpotifyClone.FOLLOWERS F
      INNER JOIN
    SpotifyClone.ARTISTS AR
    ON AR.ARTIST_ID = F.ARTIST_ID)
      INNER JOIN
    SpotifyClone.ALBUMS AL
    ON AL.ARTIST_ID = AR.ARTIST_ID
  GROUP BY
    `artista`,
    `album`
  ORDER BY
    `seguidores` DESC,
    `artista`,
    `album`;
