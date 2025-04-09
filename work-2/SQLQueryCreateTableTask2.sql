CREATE TABLE table_task2 (
    id INT,
    value FLOAT,
    created_at DATETIME,
    description NVARCHAR(100)
)

INSERT INTO table_task2 (id, value, created_at, description)
VALUES 
(1, 10.5, GETDATE(), N'����1'),
(2, 22.7, GETDATE(), N'����2'),
(3, 33.3, GETDATE(), N'����3')