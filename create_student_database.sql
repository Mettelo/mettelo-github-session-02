CREATE DATABASE IF NOT EXISTS student_database;

USE student_database;

CREATE TABLE IF NOT EXISTS students (
    student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender VARCHAR(30),
    age TINYINT UNSIGNED,
    class_attendance VARCHAR(30) NOT NULL DEFAULT 'Not recorded',
    email VARCHAR(254) NOT NULL UNIQUE,
    phone_number VARCHAR(30),
    hobby VARCHAR(255)
);
