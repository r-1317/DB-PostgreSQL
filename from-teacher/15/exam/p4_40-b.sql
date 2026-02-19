-- 別解 (COALESCEを利用)
SELECT
  a.name AS "Author",
  COALESCE(b.title || ' (' || p.name || ')', '---') AS "Title (Publisher)"
FROM
  authors AS a
  LEFT JOIN book_authors AS ba ON a.author_id = ba.author_id
  LEFT JOIN books AS b ON ba.book_id = b.book_id
  LEFT JOIN publishers AS p ON b.publisher_id = p.publisher_id
ORDER BY
  a.author_id;