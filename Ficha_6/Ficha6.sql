--  1. Construa o modelo de dados que entenda ser o mais adequado ao ficheiro WorldPort.csv
--      (Port, Region, CountryCode, Country) e faça a importação dos dados.
CREATE DATABASE IF NOT EXISTS WorldPort;
USE WorldPort;

-- Tabela para Paises
CREATE TABLE IF NOT EXISTS Pais (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Pais VARCHAR(60) NOT NULL,
    Code VARCHAR(2) NOT NULL UNIQUE
);

-- Tabela para regiões
CREATE TABLE IF NOT EXISTS Regiao (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Regiao VARCHAR(60) NOT NULL,
    PaisID INT NOT NULL,
    FOREIGN KEY (PaisID) REFERENCES Pais(ID) ON DELETE CASCADE
);

-- Tabela para ports
CREATE TABLE IF NOT EXISTS Port (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Port VARCHAR(60) NOT NULL,
    RegiaoID INT NOT NULL,
    FOREIGN KEY (RegiaoID) REFERENCES Regiao(ID) ON DELETE CASCADE
);

-- Tabela temporária para importação
CREATE TABLE IF NOT EXISTS TEMP (
    Port VARCHAR(60),
    Regiao VARCHAR(60),
    PaisCode VARCHAR(2),
    Pais VARCHAR(60)
);

-- Load data do CSV para a tabela TEMP
LOAD DATA LOCAL INFILE '/var/lib/mysql-files/WorldPort.csv'
INTO TABLE TEMP
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
(Port, Regiao, PaisCode, Pais);

-- Insert distinct countries into the Pais table
INSERT INTO Pais (Pais, Code)
SELECT DISTINCT Pais, PaisCode
FROM TEMP
ON DUPLICATE KEY UPDATE Code = VALUES(Code);

-- Adicionar Regiões na tabela
INSERT INTO Regiao (Regiao, PaisID)
SELECT DISTINCT Regiao, p.ID
FROM TEMP t
JOIN Pais p ON t.PaisCode = p.Code;

-- Adicionar Port na tabela
INSERT INTO Port (Port, RegiaoID)
SELECT DISTINCT Port, r.ID
FROM TEMP t
JOIN Regiao r ON t.Regiao = r.Regiao;
JOIN Pais p ON r.PaisID = p.ID
WHERE t.Pais = p.Pais;


-- 2. Crie os utilizadores “tmpPort”, “usrPort” e “admPort”.
CREATE USER IF NOT EXISTS 'tmpPort'@'localhost' IDENTIFIED BY 'tmpPort123';
CREATE USER IF NOT EXISTS 'usrPort'@'localhost' IDENTIFIED BY 'usrPort123';
CREATE USER IF NOT EXISTS 'admPort'@'localhost' IDENTIFIED BY 'admPort123';

/* 3. Atribua as seguintes permissões aos utilizadores:
 *   ◦ “tmpPort” - Leitura de todas as tabelas da BD WorldPort.
 *   ◦ “usrPort” - Leitura de todas as tabelas da BD WorldPort e escrita na tabela Port.
 *   ◦ “admPort” - Permissões totais sobre a BD WorldPort. */
GRANT SELECT ON WorldPort.* TO 'tmpPort'@'localhost';
GRANT SELECT, INSERT, UPDATE ON WorldPort.* TO 'usrPort'@'localhost';
GRANT ALL PRIVILEGES ON WorldPort.* TO 'admPort'@'localhost';

/* 4. Retire todas as permissões ao utilizador “tmpPort”. */
REVOKE ALL PRIVILEGES ON WorldPort.* FROM 'tmpPort'@'localhost';

/* 5. Crie uma  VIEW  com o nome PortugalPort que liste os portos de Portugal
 *   (Port, Region, CountryCode, Country). */
CREATE OR REPLACE VIEW PortugalPort AS
SELECT p.Port, r.Regiao, p.Code AS PaisCode, p.Pais
FROM Port p
JOIN Regiao r ON p.RegiaoID = r.ID
JOIN Pais pa ON r.PaisID = pa.ID
WHERE pa.Pais = 'Portugal';

/* 6. Faça a exportação para ficheiro da VIEW criada anteriormente. */
SELECT * FROM PortugalPort
INTO OUTFILE 'C:/Users/vanes/Downloads/PortugalPort.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

/* 7. Faça um Backup da BD WorldPort.*/
mysqldump -u root -p WorldPort > 'C:/Users/vanes/Downloads/Backup_PORT.SQL'