SELECT
  MAX(a.name) AS "名前",
  COUNT(b.book_id) AS "著作書籍数",
  -- COUNT(ba.author_id) AS "著作書籍数", -- これでも可
  COALESCE(SUM(b.print_run), 0) AS "総印刷部数",
FROM
  authors AS a
  LEFT JOIN book_authors AS ba ON a.author_id = ba.author_id
  LEFT JOIN books AS b ON ba.book_id = b.book_id
GROUP BY
  a.author_id
ORDER BY
  a.author_id;