USE Aeroport_2015_Laurent
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'S_Appareil')
	BEGIN
		RAISERROR(60001, 12, 1,'S_Appareil')
	END
ELSE
	BEGIN
		DECLARE @message nvarchar(100);
		SELECT @message = CHAR(13) + 'Impossible de poursuivre l''exécution de la requête de création.'

		PRINT 'DÉPARTEMENT DE LA GESTION DES APPAREILS'
		PRINT '******************************************************************'  

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblAppareil')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblAppareil', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblAppareil
				(noImmatriculation			CHAR(7)				NOT NULL,
				 noSerieAppareil			VARCHAR(20)			NOT NULL,
				 statutAppareil				VARCHAR(15)			NOT NULL,
				 nbHeuresVol				INT					NOT NULL,
				 codeCie					CHAR(2)				NOT NULL,
				 codeTypeAppareil			VARCHAR(15)			NOT NULL)
				 PRINT 'Création de la table tblAppareil terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblAppareilPiece')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblAppareilPiece', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblAppareilPiece
				(codeTypeAppareil			VARCHAR(15)			NOT NULL,
				 noPiece					INT					NOT NULL)
				 PRINT 'Création de la table tblAppareilPiece terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblCommande')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblCommande', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblCommande
				(noCommande					INT					NOT NULL,
				 dateCommande				DATE				NOT NULL,
				 statutCommande				VARCHAR(10)			NOT NULL,
				 dateReception				DATE				NOT NULL,
				 noFournisseur				VARCHAR(10)			NOT NULL)
				 PRINT 'Création de la table tblCommande terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblFournisseur')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblFournisseur', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblFournisseur
				(noFournisseur				VARCHAR(10)			NOT NULL,
				 nomFournisseur				VARCHAR(25)			NOT NULL,
				 adresseFournisseur			VARCHAR(50)			NOT NULL,
				 nomRepresentant			VARCHAR(25)			NOT NULL,
				 prenomRepresentant			VARCHAR(25)			NOT NULL)
				 PRINT 'Création de la table tblFournisseur terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPiece')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblPiece', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblPiece
				(noPiece					INT					NOT NULL,
				 nomPiece					VARCHAR(25)			NOT NULL,
				 qteMin						SMALLINT			NOT NULL,
				 qteInventaire				SMALLINT			NOT NULL)
				 PRINT 'Création de la table tblPiece terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPieceCommande')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblPieceCommande', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblPieceCommande
				(noCommande					INT					NOT NULL,
				 noPiece					INT					NOT NULL,
				 qteCommandee				SMALLINT			NOT NULL,
				 qteRecue					SMALLINT			NOT NULL)
				 PRINT 'Création de la table tblPieceCommande terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPieceCompose')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblPieceCompose', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblPieceCompose
				(noPiece					INT					NOT NULL,
				 noCOmposant				INT					NOT NULL)
				 PRINT 'Création de la table tblPieceCompose terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPieceFournisseur')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblPieceFournisseur', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblPieceFournisseur
				(noPiece					INT					NOT NULL,
				 noFournisseur				VARCHAR(10)			NOT NULL,
				 noProduit					INT					NOT NULL,
				 nomProduit					VARCHAR(30)			NOT NULL,
				 prixVenteProduit			SMALLMONEY			NOT NULL,
				 prixRevient				SMALLMONEY			NOT NULL)
				 PRINT 'Création de la table tblPieceFournisseur terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblSiegeAppareil')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblSiegeAppareil', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblSiegeAppareil
				(codeTypeAppareil			VARCHAR(15)			NOT NULL,
				 codeTypeSiege				CHAR(3)				NOT NULL,
				 nbSieges					SMALLINT			NOT NULL)
				 PRINT 'Création de la table tblSiegeAppareil terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblTypeAppareil')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblTypeAppareil', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblTypeAppareil
				(codeTypeAppareil			VARCHAR(15)			NOT NULL,
				 descTypeAppareil			VARCHAR(20)			NOT NULL,
				 vitesseCroisiere			SMALLINT			NOT NULL,
				 autonomieVol				SMALLINT			NOT NULL)
				 PRINT 'Création de la table tblTypeAppareil terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblTypeSiege')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblTypeSiege', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Appareil.tblTypeSiege
				(codeTypeSiege				CHAR(3)				NOT NULL,
				 descTypeSiege				VARCHAR(30)			NOT NULL)
				 PRINT 'Création de la table tblTypeSiege terminée.'
			END
	END

PRINT 'création des tables de S_Appareil terminée'
PRINT '******************************************************************'
GO