SELECT
  b.title AS "Title",
  b.price AS "Price",
  p.name AS "Publisher"
FROM
  books AS b
  JOIN publishers AS p ON b.publisher_id = p.publisher_id
ORDER BY
  b.book_id;