SELECT 
  COUNT(zakaz.codz) AS "Количество заказов у фирмы ВВВ",
  gotov.textgotov AS "Готовность"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
JOIN gotov ON zakaz.codgotov = gotov.codgotov
WHERE firma.fname = 'BBB' AND gotov.textgotov = 'готов'
GROUP BY gotov.textgotov;
