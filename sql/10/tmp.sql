SELECT
  COALESCE(c1.item_id, c2.item_id, c3.item_id) AS "i_id",
  COALESCE(c1.name, c2.name, c3.name) AS "item_name",
  c1.qty AS "Marvin",
  c2.qty AS "Jack",
  c3.qty AS "Alice",
  COALESCE(c1.description, c2.description, c3.description) AS "description"
FROM
  (
    SELECT
      ci.item_id,
      i.name,
      ci.qty,
      i.description
    FROM
      x_character_items AS ci
      JOIN x_items AS i ON ci.item_id = i.item_id
      JOIN x_characters AS C ON ci.character_id = c.character_id
    WHERE
      c.name = 'Marvin'
  ) AS c1
  FULL OUTER JOIN ( -- ◀ 完全外部結合
    SELECT
      ci.item_id,
      i.name,
      ci.qty,
      i.description
    FROM
      x_character_items AS ci
      JOIN x_items AS i ON ci.item_id = i.item_id
      JOIN x_characters AS C ON ci.character_id = c.character_id
    WHERE
      c.name = 'Jack'
  ) AS c2 ON c1.item_id = c2.item_id
  FULL OUTER JOIN ( -- ◀ 完全外部結合
    SELECT
      ci.item_id,
      i.name,
      ci.qty,
      i.description
    FROM
      x_character_items AS ci
      JOIN x_items AS i ON ci.item_id = i.item_id
      JOIN x_characters AS C ON ci.character_id = c.character_id
    WHERE
      c.name = 'Alice'
  ) AS c3 ON c1.item_id = c3.item_id
ORDER BY
  COALESCE(c1.item_id, c2.item_id, c3.item_id);