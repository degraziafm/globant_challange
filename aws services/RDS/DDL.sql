CREATE TABLE IF NOT EXISTS hired_employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    datetime TIMESTAMP,
    department_id INT NOT NULL,
    job_id INT NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS departments (
    id INT PRIMARY KEY,
    department VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS jobs (
    id INT PRIMARY KEY,
    job VARCHAR(100) NOT NULL
)  ENGINE=INNODB;