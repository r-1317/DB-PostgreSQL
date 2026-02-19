-- 別解 ～FROM句を使用した例～
START TRANSACTION;

UPDATE books AS b
SET
  price = 0.9 * price
FROM
  (
    SELECT
      book_id
    FROM
      book_purchases
    GROUP BY
      book_id
    HAVING
      SUM(qty) > 10
  ) AS bp
WHERE
  b.book_id = bp.book_id
RETURNING
  b.book_id,
  b.title,
  b.price;

ROLLBACK;