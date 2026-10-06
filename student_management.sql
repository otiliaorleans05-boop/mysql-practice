-- Su dung hoac tao CSDL student_management
CREATE DATABASE IF NOT EXISTS `student_management`;
USE `student_management`;

-- Tao bang Class gom: id, name
CREATE TABLE IF NOT EXISTS `Class` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

-- Tao bang Teacher gom: id, name, age, country
CREATE TABLE IF NOT EXISTS `Teacher` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `age` INT,
    `country` VARCHAR(50)
);
