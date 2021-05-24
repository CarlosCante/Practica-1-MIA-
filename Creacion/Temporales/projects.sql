CREATE TABLE IF NOT EXISTS practica.tmp_projects(
	project_id VARCHAR(500),
	is_geocoded VARCHAR(500),
	project_title VARCHAR(500),
	start_actual_isodate VARCHAR(500),
	end_actual_isodate VARCHAR(500),
	donors VARCHAR(500),
	donors_iso3 VARCHAR(500),
	recipients VARCHAR(500),
	recipients_iso3 VARCHAR(500),
	ad_sector_codes VARCHAR(500),
	ad_sector_names VARCHAR(500),
	status VARCHAR(500),
	transactions_start_year VARCHAR(500),
	transactions_end_year VARCHAR(500),
	total_commitments VARCHAR(500),
	total_disbursements VARCHAR(500)
)