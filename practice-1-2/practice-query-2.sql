SELECT  STRING_AGG(fio, ',') FROM authors;

SELECT [fio]  "Автор", -- автор
               [bname] "Название" -- название книги
FROM [MyDB].[dbo].[books]
left join [MyDB].[dbo].[authbook] on books.id=authbook.id -- левое внешнее соединение
left join [MyDB].[dbo].[authors] on authbook.idauth=authors.idas -- левое внешнее соединение


-- отобразить список всех книг с авторами, в названии которых присутствует слово Oracle
where bname like '%Oracle%' -- поиск по шаблону. % означает любое количество любых символов


-- показать среднюю стоимость всех книг в каждой категории
SELECT [catname] "Категория", CAST(AVG([price]) AS DECIMAL(10,2)) "Средняя стоимость"
	FROM [MyDB].[dbo].[cats] join [MyDB].[dbo].[books] on cats.idcat=books.idcat
	GROUP BY [cats].[catname]


-- отобразить название книги и месяц издания в текстовом формате
SELECT [bname] , DATENAME(mm,[dateizd])  FROM [MyDB].[dbo].[books]


--определить разницу в месяцах между двумя датами
SELECT DATEDIFF(mm,'12.8.2025', '12.12.2025') -- 4 месяца
SET DATEFORMAT dmy  -- день месяц год(или dmy, ymd и т.п.)
SET LANGUAGE русский


--отобразите список названий всех книг, изданных в 2020 году
SELECT [bname] ,[dateizd] FROM [MyDB].[dbo].[books]
	WHERE YEAR([dateizd])=2020


-- отобразите через запятую интервал дат(только год) для каждой категории книг
SELECT 
  cats.catname AS [Категория],
  CAST(MIN(YEAR(books.dateizd)) AS NVARCHAR(4)) + N' - ' + CAST(MAX(YEAR(books.dateizd)) AS NVARCHAR(4)) AS [Интервал]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
GROUP BY 
  cats.catname

-- используя фразу join для соединения таблиц отобразить список всех книг в категории Сказки
SELECT 
  books.bname AS [Название книги],
  cats.catname AS [Категория]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
WHERE 
  cats.catname = 'Сказки'


-- используя фразу join для соединения таблиц отобразить  среднюю стоимость книг по каждой категории
SELECT 
  cats.catname AS [Категория],
  CAST(AVG(books.price) AS DECIMAL(10, 2)) AS [Средняя стоимость]
FROM 
  dbo.books
JOIN 
  dbo.cats ON books.idcat = cats.idcat
GROUP BY 
  cats.catname


-- используя фразу join для соединения таблиц отобразить в каждой категории список книг, стоимость которых выше чем в данной категории
SELECT 
  cats.catname AS [Категория],
  books.bname AS [Книга],
  books.price AS [Цена]
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

