USE Aeroport_2015_Laurent
GO

DECLARE @message nvarchar(100);
SELECT @message = CHAR(13) + 'Impossible de poursuivre l''exécution de la requête de création.' + CHAR(13)



IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'APP_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'APP_PK', 'tblAppareil', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblAppareil ADD
				CONSTRAINT APP_PK
				PRIMARY KEY (noImmatriculation)
				PRINT 'Contrainte PRIMARY KEY APP_PK pour la TABLE tblAppareil ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'APPPIE_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'APPPIE_PK', 'tblAppareilPiece',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblAppareilPiece ADD
				CONSTRAINT APPPIE_PK
				PRIMARY KEY (codeTypeAppareil, noPiece)
				PRINT 'Contrainte PRIMARY KEY APPPIE_PK pour la TABLE tblArret ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'COM_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'COM_PK', 'tblCommande',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblCommande ADD
				CONSTRAINT COM_PK
				PRIMARY KEY (noCommande)
				PRINT 'Contrainte PRIMARY KEY COM_PK pour la TABLE tblCommande ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FOU_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'FOU_PK', 'tblFournisseur', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Appareil.tblFournisseur ADD
				CONSTRAINT FOU_PK
				PRIMARY KEY (noFournisseur)
				PRINT 'Contrainte PRIMARY KEY FOU_PK pour la TABLE tblFournisseur ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PIE_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PIE_PK', 'tblPiece', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Appareil.tblPiece ADD
				CONSTRAINT PIE_PK
				PRIMARY KEY (noPiece)
				PRINT 'Contrainte PRIMARY KEY PIE_PK pour la TABLE tblPiece ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PIECOM_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PIECOM_PK', 'tblPieceCommande', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblPieceCommande ADD
				CONSTRAINT PIECOM_PK
				PRIMARY KEY (noCommande, noPiece)
				PRINT 'Contrainte PRIMARY KEY PIECOM_PK pour la TABLE tblPieceCommande ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PIECMP_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PIECMP_PK', 'tblPieceCompose', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblPieceCompose ADD
				CONSTRAINT PIECMP_PK
				PRIMARY KEY (noPiece, noComposant)
				PRINT 'Contrainte PRIMARY KEY PIECMP_PK pour la TABLE tblPieceCompose ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PIEFOU_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'PIEFOU_PK', 'tblPieceFournisseur', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblPieceFournisseur ADD
				CONSTRAINT PIEFOU_PK
				PRIMARY KEY (noPiece, noFournisseur)
				PRINT 'Contrainte PRIMARY KEY PIEFOU_PK pour la TABLE tblPieceFournisseur ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'SIEAPP_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'SIEAPP_PK', 'tblSiegeAppareil', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblSiegeAppareil ADD
				CONSTRAINT SIEAPP_PK
				PRIMARY KEY (codeTypeAppareil, codeTypeSiege)
				PRINT 'Contrainte PRIMARY KEY SIEAPP_PK pour la TABLE tblSiegeAppareil ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'TYPAPP_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'TYPAPP_PK', 'tblTypeAppareil', @message)
				END
			
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblTypeAppareil ADD
				CONSTRAINT TYPAPP_PK
				PRIMARY KEY (codeTypeAppareil)
				PRINT 'Contrainte PRIMARY KEY TYPAPP_PK pour la TABLE tblTypeAppareil ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'TYPSIE_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'TYPSIE_PK', 'tblTypeSiege', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Appareil.tblTypeSiege ADD
				CONSTRAINT TYPSIE_PK
				PRIMARY KEY (codeTypeSiege)
				PRINT 'Contrainte PRIMARY KEY TYPSIE_PK pour la TABLE tblTypeSiege ajoutée.' + CHAR(13)
			END

PRINT 'création des clées primaires de S_Appareil'
GO
