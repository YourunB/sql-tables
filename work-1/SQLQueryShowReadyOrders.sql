SELECT 
  zakaz.codz AS "����� ������",
  gotov.textgotov AS "���������� ������"
FROM zakaz
JOIN gotov ON zakaz.codgotov = gotov.codgotov;
