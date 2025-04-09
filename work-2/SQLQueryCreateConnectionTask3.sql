CREATE VIEW view_task3 AS
SELECT 
  p.id, p.name, p.info,
  c.description, c.details
FROM table_task3_parent p
RIGHT JOIN table_task3_child c ON p.id = c.id
