CREATE TABLE table_task3_parent (
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  info NVARCHAR(50)
)

CREATE TABLE table_task3_child (
  id INT,
  description NVARCHAR(50),
  details NVARCHAR(50)
)
