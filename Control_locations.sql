LOAD DATA
LOCAL INFILE '/home/carlos/ARCHIVOS/Practica/CSV/locations.csv'
INTO TABLE practica.tmp_locations
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	location_type_code,
	location_type_name
);