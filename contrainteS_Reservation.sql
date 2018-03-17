USE Aeroport_2015_Laurent
GO

DECLARE @message nvarchar(100);
SELECT @message = CHAR(13) + 'Impossible de poursuivre l''exécution de la requête de création.' + CHAR(13)



IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'BIL_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'BIL_PK', 'tblBillet', @message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Reservation.tblBillet ADD
				CONSTRAINT BIL_PK
				PRIMARY KEY (noBillet)
				PRINT 'Contrainte PRIMARY KEY BIL_PK pour la TABLE tblBillet ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'BILVOL_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'BILVOL_PK', 'tblBilletVol',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Reservation.tblBilletVol ADD
				CONSTRAINT BILVOL_PK
				PRIMARY KEY (noBillet, noVol, dateDepart)
				PRINT 'Contrainte PRIMARY KEY BILVOL_PK pour la TABLE tblBilletVol ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'CLI_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'CLI_PK', 'tblClient',@message)
			END
		ELSE
			BEGIN
				ALTER TABLE S_Reservation.tblClient ADD
				CONSTRAINT CLI_PK
				PRIMARY KEY (noClient)
				PRINT 'Contrainte PRIMARY KEY CLI_PK pour la TABLE tblClient ajoutée.' + CHAR(13)
			END

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'RES_PK')
			BEGIN
				RAISERROR(60003, 12, 1, 'RES_PK', 'tblReservation', @message)
			END
		ELSE
			BEGIN 
				ALTER TABLE S_Reservation.tblReservation ADD
				CONSTRAINT RES_PK
				PRIMARY KEY (noReservation)
				PRINT 'Contrainte PRIMARY KEY RES_PK pour la TABLE tblReservation ajoutée.' + CHAR(13)
			END

PRINT 'création des clées primaires de S_Reservation terminée'
GO