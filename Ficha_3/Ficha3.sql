use databases rioDB;

LOAD DATA INFILE '/home/vanessapereira/Desktop/Shared_Folder/AtlanticSalmonRiver.csv'
INTO TABLE river;
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;