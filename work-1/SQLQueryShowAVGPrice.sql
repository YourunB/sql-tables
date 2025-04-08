SELECT 
  firma.fname AS "Название фирмы",
  AVG(zakaz.price) AS "Средняя стоимость заказа по фирме"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
GROUP BY firma.fname
HAVING AVG(zakaz.price) > (SELECT AVG(price) FROM zakaz);
