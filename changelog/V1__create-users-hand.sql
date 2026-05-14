--liquibase formatted sql
--changeset felix:1
CREATE TABLE usershands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);