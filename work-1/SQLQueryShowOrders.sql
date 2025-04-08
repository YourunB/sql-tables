SELECT 
  zakaz.codz AS "Номер заказа",
  firma.fname AS "Название фирмы"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf;
