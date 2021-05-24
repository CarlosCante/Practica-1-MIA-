CREATE TABLE IF NOT EXISTS practica.tmp_geonames(
	geomane_id VARCHAR(500) NOT NULL,
	place_name VARCHAR(500) NOT NULL,
	latitude VARCHAR(500) NOT NULL,
	longitude VARCHAR(500) NOT NULL,
	location_type_code VARCHAR(500) NOT NULL,
	location_type_name VARCHAR(500) NOT NULL,
	gazetteer_adm_code VARCHAR(500) NOT NULL,
	gazetteer_adm_name VARCHAR(500) NOT NULL,
	location_class VARCHAR(500) NOT NULL,
	geographic_exactness VARCHAR(500) NOT NULL
);