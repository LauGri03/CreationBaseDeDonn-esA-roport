USE master
GO

PRINT 'création de la base de données'
PRINT ' '

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Aeroport_2015_Laurent')
	BEGIN
		PRINT 'LA BASE DE DONNÉES Aeroport_2015_Laurent EXISTE DÉJÀ.'
		PRINT 'IMPOSSIBLE DE POURSUIVRE L''EXÉCUTION DE LA REQUÊTE DE CRÉATION.'
	END
ELSE
	BEGIN
		CREATE DATABASE Aeroport_2015_Laurent
		PRINT 'base de données créée avec succés'
		
		
	END