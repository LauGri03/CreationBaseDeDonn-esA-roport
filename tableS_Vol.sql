IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'S_Vol')
	BEGIN
		RAISERROR(60002, 12, 1,'S_Vol')
	END
ELSE
	BEGIN
		DECLARE @message nvarchar(100);
		SELECT @message = CHAR(13) + 'Impossible de poursuivre l''exécution de la requête de création.'

		PRINT 'DÉPARTEMENT DE LA GESTION DES VOLS'
		PRINT '******************************************************************'  

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblPays')
			BEGIN
				RAISERROR(60001, 12, 1, 'tblPays', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblPays
				(codePays					CHAR(2)				NOT NULL,
				 nom_pays					VARCHAR(30)			NOT NULL)
				 PRINT 'Création de la table tblPays terminée.'
			END


		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblAeroport')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblAeroport', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblAeroport
				(code_aeroport				CHAR(3)				NOT NULL,
				nom_aeroport				VARCHAR(50)			NOT NULL,
				no_tel_aeroport				VARCHAR(14)			NULL,
				heure_GMT					SMALLINT			NOT NULL,
				codeVille					CHAR(3)				NOT NULL)
				PRINT 'Création de la table tblAeroport terminée.'
			END


		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblArret')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblArret', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblArret
				(noVol						CHAR(5)				NOT NULL, 
				 codeAeroport				CHAR(3)				NOT NULL,
				 seqArret					TINYINT				NOT NULL,
				 heureArriveePrevue			TIME(7)				NOT NULL,
				 heureDepartPrevue			TIME(7)				NOT NULL,
				 distanceKmAvantArret		SMALLINT			NOT NULL)
				 PRINT 'Création de la table tblArret terminée.'
			END
 
		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblClasseBillet')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblClasseBillet', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblClasseBillet
				(codeClass					CHAR(2)				NOT NULL,
				 nomClasse					VARCHAR(20)			NOT NULL)
				 PRINT 'Création de la TABLE tblClasseBillet terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblCompagnieAerienne')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblCompagnieAerienne', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblCompagnieAerienne
				(codeCie					CHAR(2)				NOT NULL,
				 nomCie						VARCHAR(50)			NOT NULL)
				 PRINT 'Création de la TABLE tblCompagnieAerienne terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblDetailBillet')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblDetailBillet', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblDetailBillet
				(noVol						CHAR(5)				NOT NULL,
				 codeClasse					CHAR(2)				NOT NULL,
				 prixBillet					SMALLMONEY			NULL,
				 typeRepas					VARCHAR(30)			NULL)
				 PRINT 'Création de la TABLE tblDetailBillet terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblVille')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblVille', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblVille
				(codeVille					CHAR(3)				NOT NULL,
				 nomVille					VARCHAR(50)			NOT NULL,
				 codePays					CHAR(2)				NOT NULL)
				 PRINT 'Création de la TABLE tblVille terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblVillesDesservies')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblVillesDesservies', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblVillesDesservies
				(codeAeroport				CHAR(3)				NOT NULL,
				 codeVille					CHAR(3)				NOT NULL,
				 distanceKM					SMALLINT			NULL)
				PRINT 'Création de la TABLE tblVillesDesservies terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblVolsEffectifs')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblVolsEffectifs', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblVolsEffectifs
				(noVol						CHAR(5)				NOT NULL,
				 dateDepart					DATE				NOT NULL,
				 heureDepartReelle			TIME(7)				NOT NULL,
				 dateArrivee				DATE				NOT NULL,
				 heureArriveeReelle			TIME(7)				NULL,
				 noImmatriculation			CHAR(7)				NOT NULL)
				 PRINT 'Création de la TABLE tblVolsEffectifs terminée.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblVolGenerique')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblVolGenerique', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Vol.tblVolGenerique
				(noVol						CHAR(5)				NOT NULL,
				 aeroportDepart				CHAR(3)				NOT NULL,
				 aeroportArrivee			CHAR(3)				NOT NULL,
				 heureDepart				TIME(7)				NOT NULL,
				 heureArrivee				TIME(7)				NOT NULL,
				 distanceToKm				SMALLINT			NOT NULL,
				 dureeTotalePrévue			TINYINT				NOT NULL,
				 codeTypeAppareil			VARCHAR(15)			NOT NULL,
				 codeCie					CHAR(2)				NOT NULL)
				 PRINT 'Création de la TABLE tblVolGenerique terminée.'
			END
	END

PRINT 'Création des table de S_Vol terminée'
PRINT '******************************************************************'
GO