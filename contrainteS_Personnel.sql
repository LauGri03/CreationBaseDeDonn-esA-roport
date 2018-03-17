USE Aeroport_2015_Laurent
GO

DECLARE @message nvarchar(100);
SELECT @message = CHAR(13) + 'Impossible de poursuivre l''ex�cution de la requ�te de cr�ation.' + CHAR(13)



IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'AFF_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'AFF_PK', 'tblAffectation', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Personnel.tblAffectation ADD
				CONSTRAINT AFF_PK
				PRIMARY KEY (noVol, dateDepart, noMatricule, codeResp)
				PRINT 'Contrainte PRIMARY KEY AFF_PK pour la TABLE tblAffectation ajout�e.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'EMP_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'EMP_PK', 'tblEmploye',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Personnel.tblEmploye ADD
				CONSTRAINT EMP_PK
				PRIMARY KEY (noMatricule)
				PRINT 'Contrainte PRIMARY KEY EMP_PK pour la TABLE tblEmploye ajout�e.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PER_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PER_PK', 'tblPermis',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Personnel.tblPermis ADD
				CONSTRAINT PER_PK
				PRIMARY KEY (noPermis)
				PRINT 'Contrainte PRIMARY KEY PER_PK pour la TABLE tblPermis ajout�e.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'TYPRES_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'TYPRES_PK', 'tblTypeResponsabilite', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Personnel.tblTypeResponsabilite ADD
				CONSTRAINT TYPRES_PK
				PRIMARY KEY (codeResp)
				PRINT 'Contrainte PRIMARY KEY TYPRES_PK pour la TABLE tblTypeResponsabilite ajout�e.' + CHAR(13)
			END

PRINT 'cr�ation des cl�es primaires de S_Personnel termin�e'
GO