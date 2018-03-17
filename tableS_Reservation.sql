USE Aeroport_2015_Laurent
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'S_Reservation')
	BEGIN
		RAISERROR(60001, 12, 1,'S_Reservation')
	END
ELSE
	BEGIN
		DECLARE @message nvarchar(100);
		SELECT @message = CHAR(13) + 'Impossible de poursuivre l''ex�cution de la requ�te de cr�ation.'

		PRINT 'D�PARTEMENT DE LA GESTION DES R�SERVATIONS'
		PRINT '******************************************************************'  

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblBillet')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblBillet', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Reservation.tblBillet
				(noBillet					INT					NOT NULL,
				 nomPassager				VARCHAR(25)			NOT NULL,
				 prenomPassager				VARCHAR(25)			NOT NULL,
				 codeClasse					CHAR(2)				NOT NULL,
				 noReservation				INT					NOT NULL)
				 PRINT 'Cr�ation de la table tblBillet termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblBilletVol')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblBilletVol', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Reservation.tblBilletVol
				(noBillet					INT					NOT NULL,
				 noVol						CHAR(5)				NOT NULL,
				 dateDepart					DATE				NOT NULL,
				 noSiege					VARCHAR(4)			NOT NULL)
				 PRINT 'Cr�ation de la table tblBilletVol termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblClient')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblClient', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Reservation.tblClient
				(noClient					INT					NOT NULL,
				 nomClient					VARCHAR(25)			NOT NULL,
				 prenomClient				VARCHAR(25)			NOT NULL,
				 noTelCLient				VARCHAR(14)			NOT NULL,
				 adresseClient				VARCHAR(50)			NOT NULL,
				 escompte					DECIMAL(4,2)		NOT NULL)
				 PRINT 'Cr�ation de la table tblClient termin�e.'
			END

		IF EXISTS (SELECT * FROM sys.tables WHERE name = 'tblReservation')
			BEGIN
				RAISERROR(60002, 12, 1, 'tblReservation', @message)
			END
		ELSE
			BEGIN
				CREATE TABLE S_Reservation.tblReservation
				(noReservation				INT					NOT NULL,
				 dateReservation			DATE				NOT NULL,
				 statutReservation			VARCHAR(15)			NOT NULL,
				 modePaiement				VARCHAR(20)			NOT NULL,
				 statutPaiement				VARCHAR(9)			NOT NULL,
				 noClient					INT					NOT NULL)
				 PRINT 'Cr�ation de la table tblReservation termin�e.'
			END
	END

PRINT 'cr�ation des table de S_Reservation termin�e'
PRINT '******************************************************************'
GO