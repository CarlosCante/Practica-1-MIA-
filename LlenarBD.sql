INSERT INTO practica.LOCATION (location_type_code, location_type_name) 
	SELECT DISTINCT location_type_code, location_type_name FROM practica.tmp_locations;



INSERT IGNORE INTO practica.GEONAME (geomane_id, 
								place_name, 
								latitude, 
								longitude, 
								gazetteer_adm_code, 
								gazetteer_adm_name,
								location_class,
                                geographic_exactness,
								location_id)
	SELECT DISTINCT practica.tmp_geonames.geomane_id,
					practica.tmp_geonames.place_name,
					practica.tmp_geonames.latitude,
					practica.tmp_geonames.longitude,
					practica.tmp_geonames.gazetteer_adm_code,
					practica.tmp_geonames.gazetteer_adm_name,
					practica.tmp_geonames.location_class,
                    practica.tmp_geonames.geographic_exactness,
					practica.LOCATION.location_id
		FROM 
			practica.tmp_geonames,
			practica.LOCATION
		WHERE 
			practica.LOCATION.location_type_code = practica.tmp_geonames.location_type_code;




INSERT IGNORE INTO practica.COUNTRY_CODE (	name,
											iso2,
											name_aiddata_code,
											name_aiddata_name,
											name_cow_alpha,
											name_cow_numeric,
											name_fao_code,
											name_fips,
											name_geonames_id,
											name_imf_code,
											name_iso2,
											name_iso3,
											name_iso_numeric,
											name_oecd_code,
											name_oecd_name,
											name_un_code,
											name_wb_code
										)
	SELECT DISTINCT name,
					iso2,					
					name_aiddata_code,
					name_aiddata_name,
					name_cow_alpha,
					name_cow_numeric,
					name_fao_code,
					name_fips,
					name_geonames_id,
					name_imf_code,
					name_iso2,
					name_iso3,
					name_iso_numeric,
					name_oecd_code,
					name_oecd_name,
					name_un_code,
					name_wb_code
		FROM
			practica.tmp_country_codes;


INSERT IGNORE INTO practica.TYPE_STATUS(status)
	SELECT DISTINCT status FROM practica.tmp_projects;


INSERT IGNORE INTO practica.PROJECT (
									project_id,
									is_geocoded,
									project_title,
									start_actual_isodate,
									end_actual_isodate,
									donors,
									donors_iso3,
									ad_sector_codes,
									ad_sector_names,
									id_status,
									transactions_start_year,
									transactions_end_year,
									total_commitments,
									total_disbursements,
									country_code_id
									)
	SELECT DISTINCT 
					project_id,
					is_geocoded,
					project_title,
					str_to_date(start_actual_isodate,'%d/%m/%Y'),
					str_to_date(end_actual_isodate,'%d/%m/%Y'),
					donors,
					donors_iso3,
					ad_sector_codes,
					ad_sector_names,
					practica.TYPE_STATUS.id_status,
					transactions_start_year,
					transactions_end_year,
					total_commitments,
					total_disbursements,
					practica.COUNTRY_CODE.country_code_id
		FROM 
			practica.tmp_projects,
			practica.COUNTRY_CODE,
			practica.TYPE_STATUS
		WHERE
			practica.tmp_projects.recipients = practica.COUNTRY_CODE.name
			AND practica.tmp_projects.status = practica.TYPE_STATUS.status;


INSERT IGNORE INTO practica.LEVEL_1A (
									project_id,
									geomane_id,
									transactions_start_year,
									transactions_end_year,
									even_split_commitments,
									even_split_disbursements
									)
	SELECT DISTINCT practica.tmp_level_1a.project_id,
					practica.tmp_level_1a.geoname_id,
					practica.tmp_level_1a.transactions_start_year,
					practica.tmp_level_1a.transactions_end_year,
					practica.tmp_level_1a.even_split_commitments,
					practica.tmp_level_1a.even_split_disbursements
		FROM
			practica.tmp_level_1a;

INSERT IGNORE INTO practica.CURRENCY(transaction_currency)
	SELECT DISTINCT transaction_currency FROM practica.tmp_transaction;


INSERT IGNORE INTO practica.TRANSACTION(
									transaction_id,
									project_id,
									transaction_isodate,
									transaction_year,
									transaction_value_code,
									id_currency,
									transaction_value
										)
	SELECT DISTINCT transaction_id,
					project_id,
					transaction_isodate,
					transaction_year,
					transaction_value_code,
					practica.CURRENCY.id_currency,
					transaction_value
		FROM
			practica.tmp_transaction,
			practica.CURRENCY
		WHERE 
			practica.tmp_transaction.transaction_currency = practica.CURRENCY.transaction_currency;