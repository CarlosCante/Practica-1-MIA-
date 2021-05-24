-- *******************************************************************************************
--****************************************CONSULTA 1******************************************
--¿Cuántos proyectos iniciaron en el 2011?
--********************************************************************************************

SELECT COUNT(practica.PROJECT.project_id) AS Conteo
	FROM
		practica.PROJECT
	WHERE YEAR(practica.PROJECT.start_actual_isodate) = 2011;

-- *******************************************************************************************
--****************************************CONSULTA 2******************************************
--¿Cuál fue el proyecto de mayor duración?
--********************************************************************************************

SELECT DATEDIFF(practica.PROJECT.end_actual_isodate, practica.PROJECT.start_actual_isodate) AS Cantidad_Dias, practica.PROJECT.project_title
	FROM
		practica.PROJECT
    order by Cantidad_Dias DESC
    LIMIT 1;

-- *******************************************************************************************
--****************************************CONSULTA 3******************************************
--¿Cuál fue el proyecto de menor duración?
--********************************************************************************************

SELECT DATEDIFF(practica.PROJECT.end_actual_isodate, practica.PROJECT.start_actual_isodate) AS Cantidad_Dias, practica.PROJECT.project_title
	FROM
		practica.PROJECT
	WHERE 
		practica.PROJECT.end_actual_isodate IS NOT NULL
    order by Cantidad_Dias ASC
    LIMIT 1;

-- *******************************************************************************************
--****************************************CONSULTA 4******************************************
--Top 5 de países con más proyectos asignados
--********************************************************************************************

SELECT practica.COUNTRY_CODE.name AS Pais, COUNT(practica.PROJECT.country_code_id) AS Cantidad
	FROM 
		practica.COUNTRY_CODE,
		practica.PROJECT
	WHERE 
		practica.COUNTRY_CODE.country_code_id = practica.PROJECT.country_code_id
	group by Pais
    order by Cantidad DESC
    LIMIT 5;

-- *******************************************************************************************
--****************************************CONSULTA 5******************************************
--Top 5 de países con menos proyectos asignados
--********************************************************************************************

SELECT practica.COUNTRY_CODE.name AS Pais, COUNT(practica.PROJECT.country_code_id) AS Cantidad
	FROM 
		practica.COUNTRY_CODE,
		practica.PROJECT
	WHERE 
		practica.COUNTRY_CODE.country_code_id = practica.PROJECT.country_code_id
	group by Pais
    order by Cantidad ASC
    LIMIT 5;

-- *******************************************************************************************
--****************************************CONSULTA 6******************************************
--¿Cuál fue el proyecto con más costo?
--********************************************************************************************

SELECT practica.PROJECT.project_title, practica.PROJECT.total_commitments 
	FROM practica.PROJECT
    order by practica.PROJECT.total_commitments DESC
    LIMIT 1;

-- *******************************************************************************************
--****************************************CONSULTA 7******************************************
--¿Cuál fue el proyecto menos costoso?
--********************************************************************************************

SELECT practica.PROJECT.project_title, practica.PROJECT.total_commitments 
	FROM practica.PROJECT
    WHERE 
    	practica.PROJECT.total_commitments > 0
    order by practica.PROJECT.total_commitments ASC
    LIMIT 1;

-- *******************************************************************************************
--****************************************CONSULTA 8******************************************
--Top 5 de proyectos más costosos
--********************************************************************************************

SELECT practica.PROJECT.project_title, practica.PROJECT.total_commitments 
	FROM practica.PROJECT
    order by practica.PROJECT.total_commitments DESC
    LIMIT 5;

-- *******************************************************************************************
--****************************************CONSULTA 9******************************************
--Costo Total de Todos los Proyectos
--********************************************************************************************

SELECT SUM(practica.PROJECT.total_commitments) AS Total
	FROM practica.PROJECT;

-- *******************************************************************************************
--***************************************CONSULTA 10******************************************
--Top 3 de las Transacciones más Costosas RI-East Africa Public Health Laboratory Networking Project
--********************************************************************************************

SELECT practica.PROJECT.project_title AS Proyecto, practica.TRANSACTION.transaction_id AS ID, practica.TRANSACTION.transaction_value AS Costo 
	FROM 
		practica.PROJECT,
		practica.TRANSACTION
	WHERE 
		practica.PROJECT.project_title = 'AFCC2/RI-East Africa Public Health Laboratory Networking Project'
		AND practica.TRANSACTION.project_id = practica.PROJECT.project_id
        ORDER BY Costo DESC
        LIMIT 3;