SELECT 
  firma.fname AS "�������� �����",
  AVG(zakaz.price) AS "������� ��������� ������ �� �����"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
GROUP BY firma.fname
HAVING AVG(zakaz.price) > (SELECT AVG(price) FROM zakaz);
