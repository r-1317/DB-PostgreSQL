SELECT
  title AS "Title", release_date AS "ReleaseDate"
FROM
  books
WHERE
  publisher_id IN (
    SELECT
      publisher_id
    FROM
      publishers
    WHERE
      name IN ('Gamma Press', 'Delta Editions', 'Epsilon Pub')
  ) AND
  release_date >= '2020-01-01'
ORDER BY
  release_date;