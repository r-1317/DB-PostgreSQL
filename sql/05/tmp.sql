SELECT
  name AS "最も短い名前"
FROM
  s_characters
WHERE
  LENGTH(name) = (
    SELECT
      MIN(LENGTH(name))
    FROM
      s_characters
  );

SELECT
  name AS "最も長い名前"
FROM
  s_characters
WHERE
  LENGTH(name) = (
    SELECT
      MAX(LENGTH(name))
    FROM
      s_characters
  );