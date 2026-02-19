-- 非推奨 (全更新の例)
START TRANSACTION;

UPDATE books AS b
SET
  price = price * (
    SELECT
      CASE
        WHEN SUM(bp.qty) < 10 THEN 1
        ELSE 0.9
      END
    FROM
      books AS b1
      JOIN book_purchases AS bp ON b1.book_id = bp.book_id
    GROUP BY
      b1.book_id
    HAVING
      b1.book_id = b.book_id
  )
RETURNING
  b.book_id,
  b.title,
  b.price;

ROLLBACK;