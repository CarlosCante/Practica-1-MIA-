LOAD DATA
LOCAL INFILE '/home/carlos/ARCHIVOS/Practica/CSV/transactions.csv'
INTO TABLE practica.tmp_transaction
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
	transaction_id,
	project_id,
	transaction_isodate,
	transaction_year,
	transaction_value_code,
	transaction_currency,
	transaction_value
);