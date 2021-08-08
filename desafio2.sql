CREATE VIEW `estatisticas_musicais` AS
  SELECT
    COUNT(S.TITLE) `cancoes`,
    (SELECT
      COUNT(AR.FULL_NAME)
    FROM
      SpotifyClone.ARTISTS AR) `artistas`,
    (SELECT
      COUNT(AL.TITLE)
    FROM
      SpotifyClone.ALBUMS AL) `albuns`
  FROM
      SpotifyClone.SONGS S;
  