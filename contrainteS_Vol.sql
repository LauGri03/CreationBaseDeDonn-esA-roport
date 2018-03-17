USE Aeroport_2015_Laurent
GO

DECLARE @message nvarchar(100);
SELECT @message = CHAR(13) + 'Impossible de poursuivre l''exécution de la requête de création.' + CHAR(13)





IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'AER_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'AER_PK', 'tblAeroport', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblAeroport ADD
				CONSTRAINT AER_PK
				PRIMARY KEY (code_aeroport)
				PRINT 'Contrainte PRIMARY KEY AER_PK pour la TABLE tblAeroport ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'ARR_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'ARR_PK', 'tblArret',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblArret ADD
				CONSTRAINT ARR_PK
				PRIMARY KEY (noVol, codeAeroport)
				PRINT 'Contrainte PRIMARY KEY ARR_PK pour la TABLE tblArret ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'CLABIL_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'CLABILL_PK', 'tblClasseBillet',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblClasseBillet ADD
				CONSTRAINT CLABIL_PK
				PRIMARY KEY (codeClass)
				PRINT 'Contrainte PRIMARY KEY CLABIL_PK pour la TABLE tblClasseBillet ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'COMAER_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'COMAER_PK', 'tblCompagnieAerienne', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Vol.tblCompagnieAerienne ADD
				CONSTRAINT COMAER_PK
				PRIMARY  KEY (codeCie)
				PRINT 'Contrainte PRIMARY KEY COMAER_PK pour la TABLE tblCompagnieAerienne ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'DETBIL_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'DETBIL_PK', 'tblDetailBillet', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Vol.tblDetailBillet ADD
				CONSTRAINT DETBILPK_PK
				PRIMARY KEY (noVol, codeClasse)
				PRINT 'Contrainte PRIMARY KEY DETBIL_PK pour la TABLE tblDetailBillet ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PAY_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PAY_PK', 'tblPays', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblPays ADD
				CONSTRAINT PAY_PK
				PRIMARY KEY (codePays)
				PRINT 'Contrainte PRIMARY KEY PAY_PK pour la TABLE tblPays ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'VIL_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'VIL_PK', 'tblVille', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblVille ADD
				CONSTRAINT VIL_PK
				PRIMARY KEY (codeVille)
				PRINT 'Contrainte PRIMARY KEY VIL_PK pour la TABLE tblVille ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'VILDES_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'VILDES_PK', 'tblVillesDesservies', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblVillesDesservies ADD
				CONSTRAINT VILDES_PK
				PRIMARY KEY (codeAeroport, codeVille)
				PRINT 'Contrainte PRIMARY KEY VILDES_PK pour la TABLE tblVillesDesservies ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'VOLEFF_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'VOLEFF_PK', 'tblVolsEffectifs', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblVolsEffectifs ADD
				CONSTRAINT VOLEFF_PK
				PRIMARY KEY (noVol, dateDepart)
				PRINT 'Contrainte PRIMARY KEY VOLEFF_PK pour la TABLE tblVolsEffectifs ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'VOLGEN_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'VOLGEN_PK', 'tblVolGenerique', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Vol.tblVolGenerique ADD
				CONSTRAINT VOLGEN_PK
				PRIMARY KEY (noVol)
				PRINT 'Contrainte PRIMARY KEY VOLGEN_PK pour la TABLE tblVolGenerique ajoutée.' + CHAR(13)
			END

PRINT 'création des clées primaires de S_Vol terminée'
GO