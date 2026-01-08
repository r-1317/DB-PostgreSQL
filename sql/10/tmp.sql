SELECT
  c.character_id,
  c.name || '( ' || MAX(j.name) || ')' AS "name (job)",
  SUM(ci.qty) AS total_qty
FROM
  n_characters AS c
  RIGHT JOIN n_character_items AS ci ON c.character_id = ci.character_id
  -- RIGHT JOIN n_items AS i ON ci.item_id = i.item_id
  LEFT JOIN n_jobs AS j ON c.job_id = j.job_id
GROUP BY
  c.character_id
ORDER BY
  c.character_id