/* 1. Crie uma VIEW que liste os aeroportos da Península Ibérica (airport, city, IATA_FAA, ICAO).*/
CREATE VIEW aeroportos_peninsula AS
SELECT airport,
    city,
    IATA_FAA,
    ICAO
FROM airports
WHERE country IN ('Spain', 'Portugal', 'Andorra', 'Gibraltar');
/* 2. Faça a exportação para um ficheiro CSV da VIEW que criou.*/
SELECT * INTO OUTFILE 'aeroportos_peninsula.csv'
FROM aeroportos_peninsula;
/* 3. Faça um Backup da BD Airports.*/
mysqldump --host=localhost
--user=root
--password=senha
airports > backup_airports.sql;