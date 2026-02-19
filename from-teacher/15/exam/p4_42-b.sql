-- NG例
SELECT
  MAX(a.name) AS "名前",
  COUNT(*) AS "著作書籍数", -- 適切にカウントできない
  SUM(b.print_run) AS "総印刷部数" -- 適切にカウントできない
FROM
  authors AS a
  LEFT JOIN book_authors AS ba ON a.author_id = ba.author_id
  LEFT JOIN books AS b ON ba.book_id = b.book_id
GROUP BY
  a.author_id
ORDER BY
  a.author_id;