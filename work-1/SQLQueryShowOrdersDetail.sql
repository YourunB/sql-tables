SELECT 
  firma.fname AS "�������� �����",
  SUM(zakaz.price) AS "����� ����� �� ���� ������� �����",
  COUNT(zakaz.codz) AS "���������� ������� �����"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
GROUP BY firma.fname;
