-- トランザクションの開始
START TRANSACTION;

DROP TABLE IF EXISTS p_users;

-- p_users テーブルの作成 (ここを記述)
CREATE TABLE p_users (
  user_id INTEGER,
  name VARCHAR(128) NOT NULL,
  is_admin BOOLEAN NOT NULL,
  height_cm DECIMAL(4, 1),
  birthday DATE
);

-- p_users テーブルにレコードを挿入 (ここを記述)
INSERT INTO
  p_users
VALUES
  (1, 'Alice', TRUE, 162.3, '2003-10-20'),
  (2, 'Bob', FALSE, 181.9, '2002-05-05'),
  (3, 'Charlie', FALSE, NULL, NULL),
  (4, 'Ellen', TRUE, 172.7, NULL),
  (5, 'Eve', FALSE, NULL, '2004-06-30');

-- テーブルの確認
SELECT
  *
FROM
  p_users;

-- p_users テーブルを集計 (ここを記述)
SELECT
  COUNT(*) AS "user_count",
  ROUND(AVG(height_cm), 2) AS "height_avg",
  SUM(
    CASE
      WHEN is_admin = TRUE THEN 1
      ELSE 0
    END
  ) AS "admin_count"
FROM
  p_users;

-- ロールバックによる処理の取り消し
ROLLBACK;