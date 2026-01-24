-- -- B-tree インデックスの作成
-- CREATE INDEX idx_k_items_price_qty ON k_items (price, qty);
EXPLAIN
ANALYZE
SELECT
  *
FROM
  k_items
WHERE
  price BETWEEN 5000 AND 6000  AND
  qty >= 90;