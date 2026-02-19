-- データ挿入
INSERT INTO
  authors (author_id, name, country_code, birthday)
VALUES
  (1, 'Alice', 'US', '1985-04-12'),
  (2, 'Bob', 'US', '1978-11-03'),
  (3, 'Charlie', 'FR', '1990-06-25'),
  (4, 'Dave', 'US', NULL),
  (5, 'Ellen', 'JP', '1995-09-08'),
  (6, 'Gyaos', NULL, '1970-12-31');

INSERT INTO
  publishers (publisher_id, name, zip_code)
VALUES
  (1, 'Alpha Publishing', '100-0001'),
  (2, 'Beta Books', '100-1234'),
  (3, 'Gamma Press', '150-0001'),
  (4, 'Delta Editions', '150-2345'),
  (5, 'Epsilon Pub', '530-0001');

INSERT INTO
  books (book_id, title, price, print_run, release_date, publisher_id)
VALUES
  (1, 'Modern TS Part 1', 3200, 6000, '2020-04-01', 1),
  (2, 'Modern TS Part 2', 3400, 5500, '2021-03-15', 1),
  (3, 'New Rust', 3800, 4000, '2022-06-10', 3),
  (4, 'Advanced Python', 4200, 7000, '2019-11-20', 3),
  (5, 'Hello SQL vol.1', 3000, 8000, '2018-02-05', 4),
  (6, 'Hello SQL vol.2', 3200, 7500, '2019-02-05', 4),
  (7, 'Web API Basics', 3500, 9000, '2021-09-01', 5),
  (8, 'Practical C++', 4000, 5000, '2017-07-18', 5),
  (9, 'Basics of Go', 3300, 6500, '2020-12-10', 5);

INSERT INTO
  book_authors (book_id, author_id, author_order)
VALUES
  -- Modern TS Part 1 / Part 2
  (1, 1, 1), -- Alice
  (2, 1, 1), -- Alice
  (2, 6, 2), -- Gyaos
  -- New Rust
  (3, 3, 1), -- Charlie
  -- Advanced Python
  (4, 2, 1), -- Bob
  (4, 5, 2), -- Ellen
  (4, 6, 3), -- Gyaos
  -- Hello SQL vol.1 / vol.2
  (5, 5, 1), -- Ellen
  (5, 1, 2), -- Alice
  (6, 5, 1), -- Ellen
  (6, 2, 2), -- Bob
  -- Web API Basics
  (7, 2, 1), -- Bob
  -- Practical C++
  (8, 3, 1), -- Charlie
  (8, 2, 2), -- Bob
  -- Basics of Go
  (9, 6, 1) -- Gyaos
;

INSERT INTO
  book_purchases (id, book_id, qty, purchased_at)
VALUES
  (1, 1, 5, '2025-12-02 10:15:00'), -- Modern TS Part 1
  (2, 3, 3, '2025-12-02 10:15:00'), -- New Rust
  (3, 5, 10, '2025-12-10 09:00:00'), -- Hello SQL vol.1
  (4, 7, 4, '2025-12-18 16:45:00'), -- Web API Basics
  (5, 9, 6, '2025-12-27 11:20:00'), -- Basics of Go
  (6, 2, 8, '2026-01-04 13:10:00'), -- Modern TS Part 2
  (7, 4, 2, '2026-01-08 10:00:00'), -- Advanced Python
  (8, 6, 12, '2026-01-08 10:00:00'), -- Hello SQL vol.2
  (9, 8, 5, '2026-01-20 09:30:00'), -- Practical C++
  (10, 7, 7, '2026-01-31 17:55:00'), -- Web API Basics
  (11, 1, 6, '2026-02-03 11:05:00'), -- Modern TS Part 1
  (12, 3, 4, '2026-02-07 14:50:00'), -- New Rust
  (13, 4, 3, '2026-02-14 10:25:00'), -- Advanced Python
  (14, 8, 2, '2026-02-21 16:10:00'), -- Practical C++
  (15, 9, 5, '2026-02-26 09:40:00') -- Basics of Go
;

-- データ確認
SELECT
  *
FROM
  authors;

SELECT
  *
FROM
  publishers;

SELECT
  *
FROM
  books;

SELECT
  *
FROM
  book_authors;

SELECT
  *
FROM
  book_purchases;