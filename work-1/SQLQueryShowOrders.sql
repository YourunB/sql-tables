SELECT 
  zakaz.codz AS "����� ������",
  firma.fname AS "�������� �����"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf;
