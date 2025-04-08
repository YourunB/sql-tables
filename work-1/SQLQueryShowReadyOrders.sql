SELECT 
  zakaz.codz AS "Номер заказа",
  gotov.textgotov AS "Готовность заказа"
FROM zakaz
JOIN gotov ON zakaz.codgotov = gotov.codgotov;
