SELECT 
  COUNT(zakaz.codz) AS "���������� ������� �� �. ������"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
WHERE firma.city = '������';
