CREATE VIEW `top_2_hits_do_momento` AS
  SELECT
    S.TITLE `cancao`,
    COUNT(H.USER_ID) `reproducoes`
  FROM
    SpotifyClone.`HISTORY` H
      INNER JOIN
    SpotifyClone.SONGS S
    ON S.SONG_ID = H.SONG_ID
  GROUP BY
    `cancao`
  ORDER BY
    `reproducoes` DESC,
    `cancao`
  LIMIT 2;
