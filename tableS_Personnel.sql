USE Aeroport_2015_Laurent
GO


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'S_Personnel')
	BEGIN
		RAISERROR(60001, 12, 1,'S_Personnel')
	END
ELSE
	BEGIN
		DECLARE @message nvarchar(100);
		SELECT @message = CHAR(13) + 'Impossible de poursuivre l''ex�cution de la requ�te de cr�ation.'

		PRINT 'D�PARTEMENT DE LA GESTION DU PERSONNEL'
		PRINT '******************************************************************'  

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblAffectation')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblAffectation', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Personnel.tblAffectation
				(noVol						CHAR(5)				NOT NULL,
				 dateDepart					DATE				NOT NULL,
				 noMatricule				CHAR(10)			NOT NULL,
				 codeResp					CHAR(3)				NOT NULL)
				 PRINT 'Cr�ation de la table tblAffectation termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblEmploye')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblEmploye', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Personnel.tblEmploye
				(noMatricule				CHAR(10)			NOT NULL,
				 nomEmploye					VARCHAR(25)			NOT NULL,
				 prenomEmploye				VARCHAR(25)			NOT NULL,
				 totHeuresEmploye			INT					NOT NULL,
				 totHeuresSemaine			TINYINT				NOT NULL,
				 statutEmploye				VARCHAR(14)			NOT NULL,
				 categorieEmploye			VARCHAR(15)			NOT NULL,
				 noLicence					VARCHAR(9)			NOT NULL)
				 PRINT 'Cr�ation de la table tblEmploye termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPermis')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblPermis', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Personnel.tblPermis
				(noPermis					VARCHAR(9)			NOT NULL,
				 statutPermis				VARCHAR(8)			NOT NULL,
				 totHeuresVolAppareil		INT					NOT NULL,
				 noMatricule				CHAR(10)			NOT NULL,
				 codeTypeAppareil			VARCHAR(15)			NOT NULL)
				 PRINT 'Cr�ation de la table tblPermis termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblTypeResponsabilite')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblTypeResponsabilite', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Personnel.tblTypeResponsabilite
				(codeResp					CHAR(3)				NOT NULL,
				 descResp					VARCHAR(25)			NOT NULL)
				 PRINT 'Cr�ation de la table tblTypeResponsabilite termin�e.'
			END
			END
	

PRINT 'cr�ation des tables de S_Personnel termin�e'
PRINT '*******************************************************'
GO