-- Criação Base de Dados
CREATE DATABASE IF NOT EXISTS Airline;
USE Airline;

--  1. (3 val.) Construa o modelo de dados que entenda ser o mais adequado ao ficheiro airline.csv fornecido.
-- Criação de Tabela Airlines e Country
CREATE TABLE Airlines(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(60),
    Alias VARCHAR(60) DEFAULT NULL,
    IATA_Code VARCHAR(2) DEFAULT NULL UNIQUE,
    ICAO_Code VARCHAR(3) DEFAULT NULL UNIQUE,
    Callsign VARCHAR(60) DEFAULT NULL,
    Country VARCHAR(60) DEFAULT NULL
);

--  2. (3 val.) Faça a importação dos dados do ficheiro airline.csv fornecido e preencha as tabelas do modelo de dados que criou.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airline.csv'
INTO TABLE Airlines
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(ID,  Name, Alias, IATA_Code, ICAO_Code, Callsign, Country);

--  3. (1,5 val.) Crie os utilizadores “tmpAirl”,“usrAirl” e “admAirl”.
CREATE USER IF NOT EXISTS 'tmpAirl' @'localhost' IDENTIFIED BY 'tmpAirl123';
CREATE USER IF NOT EXISTS 'usrAirl' @'localhost' IDENTIFIED BY 'usrAir123';
CREATE USER IF NOT EXISTS 'admAirl' @'localhost' IDENTIFIED BY 'admAir123';

--  4. (3 val.) Atribua as permissões de acesso à base de dados que criou para os seguintes utilizadores:
--      “ tmpAirl ” - Leitura de todas as tabelas.
--      “ usrAirl ” - Leitura, inserção e alteração de todas as tabelas.
--      “ admAirl ” - Permissões totais.
GRANT SELECT ON Airline.* TO 'tmpAirl' @'localhost';
GRANT SELECT,INSERT,UPDATE ON Airline.* TO 'usrAirl' @'localhost';
GRANT ALL PRIVILEGES ON Airline.* TO 'admAirl' @'localhost';
--  Aplicar privilégios
FLUSH PRIVILEGES;

--  5.(2 val.) Retire todas as permissões ao utilizador “ tmpAirl ”.
REVOKE ALL PRIVILEGES ON *.*
FROM 'tmpAirl'@'localhost';
FLUSH PRIVILEGES;

--  6.(3 val.) Crie uma View das Airlines para cada um dos seguintes Países: Portugal Spain
CREATE VIEW Airlines_Portugal AS
SELECT * FROM Airlines WHERE Country = 'Portugal'
ORDER BY Name;

CREATE VIEW Airlines_Spain AS
SELECT * FROM Airlines WHERE Country = 'Spain'
ORDER BY Name;

--  7.(3 val.) Faça a exportação das Views que criou para ficheiros csv.
SELECT * FROM  Airlines_Portugal
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Airlines_Portugal.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n';

SELECT * FROM Airlines_Spain
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Airlines_Spain.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n';

--  8.(1, 5 val.) Faça um Backup da base de dados que criou.
mysqldump -u root -p Airline > 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/backup_airlines.sql'