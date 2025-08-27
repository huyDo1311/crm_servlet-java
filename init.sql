-- Bảng roles
CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100)
);

-- Bảng users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    avatar VARCHAR(100),
    role_id INT NOT NULL,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Bảng status
CREATE TABLE IF NOT EXISTS status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Bảng jobs
CREATE TABLE IF NOT EXISTS jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Bảng tasks
CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    user_id INT NOT NULL,
    job_id INT NOT NULL,
    status_id INT NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES status(id) ON DELETE CASCADE
);

-- Insert roles
INSERT INTO
    roles (name, description)
VALUES
    ('ROLE_ADMIN', 'Quản trị hệ thống'),
    ('ROLE_MANAGER', 'Quản lý'),
    ('ROLE_USER', 'Nhân viên');

-- Insert status
INSERT INTO
    status (name)
VALUES
    ('Chưa thực hiện'),
    ('Đang thực hiện'),
    ('Hoàn thành');

-- Insert users
INSERT INTO
    users (id, email, password, fullname, avatar, role_id)
VALUES
    (
        1,
        'nguyenvana@gmail.com',
        '123456',
        'Nguyen Van A',
        '',
        1
    ),
    (
        2,
        'nguyenvanb@gmail.com',
        '123456',
        'Nguyen Van B',
        '',
        2
    ),
    (
        3,
        'nguyenvanc@gmail.com',
        '123456',
        'Nguyen Van C',
        '',
        3
    );

-- Insert jobs
INSERT INTO
    jobs (id, name, start_date, end_date)
VALUES
    (1, 'Java springboot', '2025-08-12', '2025-08-15'),
    (2, 'build be', '2025-05-20', '2026-05-20'),
    (
        4,
        'Gillian Mccormick',
        '2025-05-20',
        '2026-05-20'
    );

-- Insert tasks
INSERT INTO
    tasks (
        id,
        name,
        start_date,
        end_date,
        user_id,
        job_id,
        status_id
    )
VALUES
    (
        1,
        'mapping data',
        '2025-08-21',
        '2026-08-21',
        1,
        1,
        1
    ),
    (2, 'Huy', '2025-05-20', '2026-05-20', 1, 1, 3),
    (
        5,
        'testing',
        '2025-08-26',
        '2026-08-26',
        2,
        1,
        2
    ),
    (
        6,
        'minning',
        '2025-08-28',
        '2026-08-28',
        3,
        1,
        2
    );