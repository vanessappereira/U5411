//Ex1
CREATE USER 'new'@'localhost' IDENTIFIED BY 'Teste2024.';
GRANT ALL PRIVILEGES ON . TO 'new'@'localhost';

//Ex2
CREATE USER 'tmpAir'@'localhost' IDENTIFIED BY 'Teste2024.';
CREATE USER 'usrAir'@'localhost' IDENTIFIED BY 'Teste2024.';
CREATE USER 'admAir'@'localhost' IDENTIFIED BY 'Teste2024.';

//Ex3
GRANT SELECT ON Airport.* TO 'tmpAir'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Airport.airport TO 'usrAir'@'localhost';
GRANT ALL PRIVILEGES ON Airport.* TO 'admAir'@'localhost';
FLUSH PRIVILEGES;

//Ex4
REVOKE SELECT ON Airport.* FROM 'tmpAir'@'localhost';
FLUSH PRIVILEGES;