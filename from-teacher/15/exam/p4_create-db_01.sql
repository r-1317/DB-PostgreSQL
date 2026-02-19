DROP TABLE IF EXISTS book_authors;

DROP TABLE IF EXISTS book_purchases;

DROP TABLE IF EXISTS books;

DROP TABLE IF EXISTS publishers;

DROP TABLE IF EXISTS authors;

--
-- 問題文に記載のテーブル定義のSQL
--
CREATE TABLE authors (
  author_id INTEGER PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  country_code CHAR(2), -- 国コード
  birthday DATE
);

CREATE TABLE publishers (
  publisher_id INTEGER PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  zip_code CHAR(8) NOT NULL
);

CREATE TABLE books (
  book_id INTEGER PRIMARY KEY,
  title VARCHAR(128) NOT NULL,
  price INTEGER NOT NULL,
  print_run INTEGER, -- 印刷部数
  release_date DATE, -- 発売日
  publisher_id INTEGER
);

CREATE TABLE book_authors (
  book_id INTEGER,
  author_id INTEGER,
  author_order INTEGER NOT NULL -- 著者順序
);

CREATE TABLE book_purchases (
  id INTEGER PRIMARY KEY,
  book_id INTEGER,
  qty INTEGER NOT NULL, -- 仕入れ冊数
  purchased_at TIMESTAMP NOT NULL -- 仕入れ日時
);
