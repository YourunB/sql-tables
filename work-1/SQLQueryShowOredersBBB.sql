SELECT 
  COUNT(zakaz.codz) AS "���������� ������� � ����� ���",
  gotov.textgotov AS "����������"
FROM zakaz
JOIN firma ON zakaz.codf = firma.codf
JOIN gotov ON zakaz.codgotov = gotov.codgotov
WHERE firma.fname = 'BBB' AND gotov.textgotov = '�����'
GROUP BY gotov.textgotov;
