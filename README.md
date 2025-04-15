# TBZ_outsourcing_configuration_data_Luk_Eli

## Explanation


## Programms you will need to install
- MySQL Server


## Setup
- Set your 
- Create this Schema and Table on your Server
- Open your CMD as admin and do these commands:
    - Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    - Get-ExecutionPolicy -List (to check, if the change was made)
- Open the cofig_reader.ps1 file as admin
- Start the programm and it shoulde work





CREATE SCHEMA outsourcing_configuration_data;

USE outsourcing_configuration_data;configuration_file

CREATE TABLE configuration_file (
    id INT AUTO_INCREMENT PRIMARY KEY,
    env_key VARCHAR(255) NOT NULL,
    env_value TEXT
);
