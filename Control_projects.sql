LOAD DATA
LOCAL INFILE '/home/carlos/ARCHIVOS/Practica/CSV/projects.csv'
INTO TABLE practica.tmp_projects
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	project_id,
	is_geocoded,
	project_title,
	start_actual_isodate,
	end_actual_isodate,
	donors,
	donors_iso3,
	recipients,
	recipients_iso3,
	ad_sector_codes,
	ad_sector_names,
	status,
	transactions_start_year,
	transactions_end_year,
	total_commitments,
	total_disbursements
);