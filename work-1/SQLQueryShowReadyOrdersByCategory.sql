SELECT 
  gotov.textgotov AS "Категория готовности заказа",
  COUNT(zakaz.codz) AS "Количество заказов"
FROM zakaz
JOIN gotov ON zakaz.codgotov = gotov.codgotov
GROUP BY gotov.textgotov;
