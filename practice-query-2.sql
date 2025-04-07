SELECT  STRING_AGG(fio, ',') FROM authors;

SELECT [fio]  "�����", -- �����
               [bname] "��������" -- �������� �����
FROM [MyDB].[dbo].[books]
left join [MyDB].[dbo].[authbook] on books.id=authbook.id -- ����� ������� ����������
left join [MyDB].[dbo].[authors] on authbook.idauth=authors.idas -- ����� ������� ����������


-- ���������� ������ ���� ���� � ��������, � �������� ������� ������������ ����� Oracle
where bname like '%Oracle%' -- ����� �� �������. % �������� ����� ���������� ����� ��������


-- �������� ������� ��������� ���� ���� � ������ ���������
SELECT [catname] "���������", CAST(AVG([price]) AS DECIMAL(10,2)) "������� ���������"
	FROM [MyDB].[dbo].[cats] join [MyDB].[dbo].[books] on cats.idcat=books.idcat
	GROUP BY [cats].[catname]


-- ���������� �������� ����� � ����� ������� � ��������� �������
SELECT [bname] , DATENAME(mm,[dateizd])  FROM [MyDB].[dbo].[books]


--���������� ������� � ������� ����� ����� ������
SELECT DATEDIFF(mm,'12.8.2025', '12.12.2025') -- 4 ������
SET DATEFORMAT dmy  -- ���� ����� ���(��� dmy, ymd � �.�.)
SET LANGUAGE �������


--���������� ������ �������� ���� ����, �������� � 2020 ����
SELECT [bname] ,[dateizd] FROM [MyDB].[dbo].[books]
	WHERE YEAR([dateizd])=2020


-- ���������� ����� ������� �������� ���(������ ���) ��� ������ ��������� ����
SELECT 
  cats.catname AS [���������],
  CAST(MIN(YEAR(books.dateizd)) AS NVARCHAR(4)) + N' - ' + CAST(MAX(YEAR(books.dateizd)) AS NVARCHAR(4)) AS [��������]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
GROUP BY 
  cats.catname

-- ��������� ����� join ��� ���������� ������ ���������� ������ ���� ���� � ��������� ������
SELECT 
  books.bname AS [�������� �����],
  cats.catname AS [���������]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
WHERE 
  cats.catname = '������'


-- ��������� ����� join ��� ���������� ������ ����������  ������� ��������� ���� �� ������ ���������
SELECT 
  cats.catname AS [���������],
  CAST(AVG(books.price) AS DECIMAL(10, 2)) AS [������� ���������]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
GROUP BY 
  cats.catname


-- ��������� ����� join ��� ���������� ������ ���������� � ������ ��������� ������ ����, ��������� ������� ���� ��� � ������ ���������
SELECT 
  cats.catname AS [���������],
  books.bname AS [�����],
  books.price AS [����]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
JOIN (
    SELECT 
      idcat,
      AVG(price) AS avg_price
    FROM 
      dbo.books
    GROUP BY 
      idcat
) AS avg_prices ON books.idcat = avg_prices.idcat
WHERE 
  books.price > avg_prices.avg_price

