-- Tao CSDL moi ten demo
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Tao bang Student
CREATE TABLE Student (
    id INT,
    name VARCHAR(200),
    age INT,
    country VARCHAR(50)
);
