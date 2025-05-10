-- DROP DATABASE db;
-- CREATE DATABASE db;
USE db;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id int NOT NULL,
    username varchar(255) NOT NULL,
    email varchar(255),
    age int,
    PRIMARY KEY (id)
);