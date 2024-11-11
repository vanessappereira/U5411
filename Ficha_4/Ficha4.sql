/* 1. Faça a exportação da tabela Country para um ficheiro CSV.*/
SELECT
    * INTO OUTFILE '/home/SharedDrive/U5411/country.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
FROM
    Country;

/* 2. Faça a exportação dos nomes dos rios da Norway para um ficheiro CSV.*/
SELECT
    River.Name INTO OUTFILE '/home/SharedDrive/U5411/rios_noruega.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
FROM
    River
    INNER JOIN Country ON River.CountryID = Country.ID
WHERE
    Country.Country = 'Norway';

/* 3. Crie um Backup da base de dados SalmonRiver.*/
mysqldump salmonRiver > / home / SharedDrive / U5411 / salmonRiver.sql;

/* 4. Crie três Backup, um para cada tabela da base de dados SalmonRiver. */
SELECT
    * INTO OUTFILE '/home/SharedDrive/U5411/backup_country.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
FROM
    Country;

SELECT
    * INTO OUTFILE '/home/SharedDrive/U5411/backup_category.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
FROM
    Category;

SELECT
    * INTO OUTFILE '/home/SharedDrive/U5411/backup_river.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
FROM
    River;

load data infile '/var/lib/mysql-files/Especie.csv' into table especie FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (codigo, NomeComum, NomeCientifico);