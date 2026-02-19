-- 別解 (非推奨 内部結合を利用)
SELECT
  a.name AS "Author",
  b.title AS "Title",
  b.print_run AS "PrintRun"
FROM
  authors AS a
  LEFT JOIN (
    book_authors AS ba
    JOIN books AS b ON ba.book_id = b.book_id
  ) ON a.author_id = ba.author_id
ORDER BY
  a.author_id;
