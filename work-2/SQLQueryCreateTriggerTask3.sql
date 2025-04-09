CREATE TRIGGER trg_insert_view_task3
ON view_task3
INSTEAD OF INSERT
AS
BEGIN
  SET NOCOUNT ON

  DECLARE @id INT, @name NVARCHAR(50), @info NVARCHAR(50),
          @description NVARCHAR(50), @details NVARCHAR(50)

  SELECT TOP 1 
    @id = id,
    @name = name,
    @info = info,
    @description = description,
    @details = details
  FROM inserted

  IF NOT EXISTS (SELECT 1 FROM table_task3_parent WHERE id = @id)
  BEGIN
    INSERT INTO table_task3_parent(id, name, info) 
    VALUES (@id, @name, @info)
    PRINT N'Добавлено в родительскую таблицу: ' + CAST(@id AS NVARCHAR) + N' ' + @name + N' ' + @info
  END

  INSERT INTO table_task3_child(id, description, details) 
  VALUES (@id, @description, @details)
  PRINT N'Добавлено в дочернюю таблицу: ' + CAST(@id AS NVARCHAR) + N' ' + @description + N' ' + @details
END
