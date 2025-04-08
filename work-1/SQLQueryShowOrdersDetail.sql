SELECT 
  firma.fname AS "Название фирмы",
  SUM(zakaz.price) AS "Общая сумма по всем заказам фирмы",
  COUNT(zakaz.codz) AS "Количество заказов фирмы"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
GROUP BY firma.fname;
