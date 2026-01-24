CREATE EXTENSION IF NOT EXISTS pgcrypto;

START TRANSACTION;

DROP TABLE IF EXISTS k_items;

-- k_itemsの作成
-- item_id: 主キー。順番に採番されるID
-- price: 商品の価格
-- qty: 商品の在庫数
-- created_at: レコード作成日時
CREATE TABLE k_items (
  item_id SERIAL PRIMARY KEY,
  price INTEGER NOT NULL,
  qty INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- サンプルデータを10^8件挿入
INSERT INTO
  k_items (price, qty, created_at)
SELECT
  (RANDOM() * 10000)::INTEGER AS price,
  (RANDOM() * 100)::INTEGER AS qty,
  NOW() - (RANDOM() * INTERVAL '365 days') AS created_at
FROM
  GENERATE_SERIES(1, 100000000);

-- -- B-Treeインデックスの作成
-- CREATE INDEX idx_k_items_price_qty ON k_items (price, qty);
COMMIT;