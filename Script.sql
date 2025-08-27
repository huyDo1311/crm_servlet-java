CREATE DATABASE crm_app;
USE crm_app;

CREATE TABLE IF NOT EXISTS roles (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    avatar VARCHAR(100),
    role_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS status (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS jobs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    user_id INT NOT NULL,
    job_id INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles (id)  ON DELETE CASCADE;
ALTER TABLE tasks ADD FOREIGN KEY (user_id) REFERENCES users (id)  ON DELETE CASCADE;
ALTER TABLE tasks ADD FOREIGN KEY (job_id) REFERENCES jobs (id)  ON DELETE CASCADE;
ALTER TABLE tasks ADD FOREIGN KEY (status_id) REFERENCES status (id)  ON DELETE CASCADE;

INSERT INTO roles( name, description ) VALUES ("ROLE_ADMIN", "Quản trị hệ thống");
INSERT INTO roles( name, description ) VALUES ("ROLE_MANAGER", "Quản lý");
INSERT INTO roles( name, description ) VALUES ("ROLE_USER", "Nhân viên");

INSERT INTO status( name ) VALUES ("Chưa thực hiện");
INSERT INTO status( name ) VALUES ("Đang thực hiện");
INSERT INTO status( name ) VALUES ("Đang thực hiện");

SELECT * 
FROM users u
WHERE u.email = 'nguyenvana@gmail.com' AND u.password = '123456'

USE crm_app;
SELECT * FROM users u JOIN roles r ON u.role_id = r.id

SELECT * FROM jobs
select * from roles

insert into roles (name, description) values('Test', 'Test desc');

DELETE FROM users u WHERE u.id = 2


SELECT t.id, t.name, t.start_date, t.end_date, t.status_id,
       u.fullName as userName, j.name as jobName
FROM tasks t
JOIN users u ON t.user_id = u.id
JOIN jobs j ON t.job_id = j.id
WHERE j.id = 1;

SELECT 
    t.id AS task_id, 
    t.name AS task_name, 
    t.start_date, 
    t.end_date, 
    t.user_id, 
    t.job_id, 
    t.status_id, 
    u.fullname AS user_name, 
    j.name AS job_name, 
    s.name AS status_name
FROM tasks t
LEFT JOIN users u ON t.user_id = u.id
JOIN jobs j ON t.job_id = j.id
JOIN status s ON t.status_id = s.id
ORDER BY t.id ASC;

-- Insert users
INSERT INTO users (id, email, password, fullname, avatar, role_id) VALUES
(1, 'nguyenvana@gmail.com', '123456', 'Nguyen Van A', '', 1),
(2, 'nguyenvanb@gmail.com', '123456', 'Nguyen Van B', '', 2),
(3, 'nguyenvanc@gmail.com', '123456', 'Nguyen Van C', '', 3);

-- Insert jobs
INSERT INTO jobs (id, name, start_date, end_date) VALUES
(1, 'Java springboot', '2025-08-12', '2025-08-15'),
(2, 'build be', '2025-05-20', '2026-05-20'),
(4, 'Gillian Mccormick', '2025-05-20', '2026-05-20');

-- Insert tasks
INSERT INTO tasks (id, name, start_date, end_date, user_id, job_id, status_id) VALUES
(1, 'mapping data', '2025-08-21', '2026-08-21', 1, 1, 1),
(2, 'Huy', '2025-05-20', '2026-05-20', 1, 1, 3),
(5, 'testing', '2025-08-26', '2026-08-26', 2, 1, 2),
(6, 'minning', '2025-08-28', '2026-08-28', 3, 1, 2);



