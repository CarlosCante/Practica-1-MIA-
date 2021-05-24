LOAD DATA
LOCAL INFILE '/home/carlos/ARCHIVOS/Practica/CSV/geonames.csv'
INTO TABLE practica.tmp_geonames
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	geomane_id,
	place_name,
	latitude,
	longitude,
	location_type_code,
	location_type_name,
	gazetteer_adm_code,
	gazetteer_adm_name,
	location_class,
	geographic_exactness
);