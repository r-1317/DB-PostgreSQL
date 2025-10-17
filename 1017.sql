SELECT
  id,
  name,
  last_login_at,
  current_date - CAST(last_login_at AS DATE) || '日前' AS "最終ログイン",
  CASE
    WHEN current_date - CAST(last_login_at AS DATE) <= 50 THEN 'Yes'
    ELSE 'No'
  END AS "Is Active User?"
FROM
  s_characters;
