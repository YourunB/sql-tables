CREATE TABLE t1 (
    f1 INT,
    f2 INT,
    f3 VARCHAR(10)
);

INSERT INTO t1 (f1, f2, f3) 
VALUES 
    (1, 10, 'aa'),
    (2, 40, 'bb'),
    (3, 50, 'cc');

CREATE TABLE t2 (
    f1 INT,
    f4 VARCHAR(10)
);

INSERT INTO t2 (f1, f4) 
VALUES 
    (4, 'dd'),
    (5, 'ee');
