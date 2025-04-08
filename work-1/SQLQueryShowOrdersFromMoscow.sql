SELECT 
  COUNT(zakaz.codz) AS "Количество заказов по г. Москва"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
WHERE firma.city = 'Москва';
