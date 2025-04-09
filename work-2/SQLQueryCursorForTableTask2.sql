DECLARE @id INT
DECLARE @value FLOAT
DECLARE @created_at DATETIME
DECLARE @description NVARCHAR(100)

DECLARE cursor_table_task2 CURSOR FOR
SELECT id, value, created_at, description FROM table_task2

OPEN cursor_table_task2

FETCH NEXT FROM cursor_table_task2 INTO @id, @value, @created_at, @description

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT CAST(@id AS NVARCHAR) + ' ' + 
		CAST(@value AS NVARCHAR) + ' ' + 
		CAST(@created_at AS NVARCHAR) + ' ' + 
		@description

    FETCH NEXT FROM cursor_table_task2 INTO @id, @value, @created_at, @description
END

CLOSE cursor_table_task2
DEALLOCATE cursor_table_task2
