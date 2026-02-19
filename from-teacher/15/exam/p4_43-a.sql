START TRANSACTION;

SELECT
  book_id,
  SUM(qty)
FROM
  book_purchases
GROUP BY
  book_id
HAVING
  SUM(qty) >= 10
ORDER BY
  book_id;

SELECT
  book_id,
  title,
  price
FROM
  books;

UPDATE books
SET
  price = 0.9 * price
WHERE
  book_id IN (
    SELECT
      book_id
    FROM
      book_purchases
    GROUP BY
      book_id
    HAVING
      SUM(qty) > 10
  )
RETURNING
  book_id,
  title,
  price;

ROLLBACK;