CREATE VIEW `top_3_artistas` AS
  SELECT
    A.FULL_NAME `artista`,
    COUNT(F.USER_ID) `seguidores`
  FROM
    SpotifyClone.FOLLOWERS F
      INNER JOIN
    SpotifyClone.ARTISTS A
    ON F.ARTIST_ID = A.ARTIST_ID
  GROUP BY
    `artista`
  ORDER BY
    `seguidores` DESC,
    `artista`
  LIMIT 3;
