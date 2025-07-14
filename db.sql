-- Create the database
CREATE DATABASE IF NOT EXISTS platform_app;
USE platform_app;

-- 1. Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);

-- 2. Platforms table
CREATE TABLE IF NOT EXISTS platforms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(100) NOT NULL,
    ip VARCHAR(45) NOT NULL
);

-- 3. Services table
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_id INT NOT NULL,
    service_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE CASCADE
);

-- 4. Platform-specific users table
CREATE TABLE IF NOT EXISTS platform_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);

-- Insert a sample admin user (username: admin, password: admin123)
INSERT INTO users (username, password, role) VALUES (
    'admin',
    '$2y$10$QhjqQJqZqkLj8WQbeyKD7uODJbYZAKJDk8Mmn1cz8rhD6sMBa1i9i', -- hashed password for "admin123"
    'admin'
);

-- Insert sample platforms
INSERT INTO platforms (platform_name, ip) VALUES
('Platform Alpha', '192.168.0.1'),
('Platform Beta', '10.0.0.5');

-- Insert sample services
INSERT INTO services (platform_id, service_name) VALUES
(1, 'Authentication Service'),
(1, 'Data Analytics'),
(2, 'Email Gateway');

-- Insert platform-specific users
INSERT INTO platform_users (name, username, password, role) VALUES
('John Doe', 'jdoe', '$2y$10$eUeRWfWd5tVXp8K7ldV01uJKV28WjBvWi7PwY2gXhZ1sKRhIl/MCW', 'user'); -- password: pass123
