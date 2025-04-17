
CREATE SCHEMA outsourcing_configuration_data;

USE outsourcing_configuration_data;

CREATE DATABASE konfig_test;
USE konfig_test;

CREATE TABLE configs (
    `key` VARCHAR(50) PRIMARY KEY,
    `value` VARCHAR(255)
);

-- Beispiel: mit Zaun-Verschlüsselung (hier secret key = 3)
-- 'localhost' ➜ 'orfdkvvwvw'
-- 'admin' ➜ 'dgplq'
-- 'MeinGeheimesPasswort' ➜ 'PhlqJhkhlphvSdvvzrug'

INSERT INTO configs (`key`, `value`) VALUES
('DB_HOST', 'orfdkvvwvw'),
('DB_USER', 'dgplq'),
('DB_PASS', 'PhlqJhkhlphvSdvvzrug');

-- ein test machen, ob die values reingekommen sind
SELECT * FROM configs
