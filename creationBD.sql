USE master
GO

PRINT 'cr�ation de la base de donn�es'
PRINT ' '

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Aeroport_2015_Laurent')
	BEGIN
		PRINT 'LA BASE DE DONN�ES Aeroport_2015_Laurent EXISTE D�J�.'
		PRINT 'IMPOSSIBLE DE POURSUIVRE L''EX�CUTION DE LA REQU�TE DE CR�ATION.'
	END
ELSE
	BEGIN
		CREATE DATABASE Aeroport_2015_Laurent
		PRINT 'base de donn�es cr��e avec succ�s'
		
		
	END