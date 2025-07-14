-- Create the database
CREATE DATABASE IF NOT EXISTS platform_app;
USE platform_app;

-- 1. Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- hashed password
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);

-- 2. Platforms table
CREATE TABLE IF NOT EXISTS platforms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(100) NOT NULL,
    ip VARCHAR(45) NOT NULL -- IPv4 or IPv6 compatible
);

-- 3. Services table
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_id INT NOT NULL,
    service_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (platform_id) REFERENCES platforms(id) ON DELETE CASCADE
);

-- 4. Platform Users table (optional for tracking users per platform)
CREATE TABLE IF NOT EXISTS platform_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);
