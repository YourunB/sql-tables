SELECT 
  gotov.textgotov AS "��������� ���������� ������",
  COUNT(zakaz.codz) AS "���������� �������"
FROM zakaz
JOIN gotov ON zakaz.codgotov = gotov.codgotov
GROUP BY gotov.textgotov;
