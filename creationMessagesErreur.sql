USE Aeroport_2015_Laurent
GO

EXEC sp_addmessage	@msgnum = 60001, @severity = 12,
				@msgtext = 'La table %s existe déjà dans la base de données Aeroport_2015_Laurent. %s',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60001, @severity = 12,
				@msgtext = 'La table %1! existe déjà dans la base de données Aeroport_2015_Laurent.%2!',
				@lang = 'french'

EXEC sp_addmessage	@msgnum = 60002, @severity = 12,
				@msgtext = 'Le schéma %s n''existe pas dans la base de données Aeroport_2015_Laurent.',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60002, @severity = 12,
				@msgtext = 'Le schéma %1! n''existe pas dans la base de données Aeroport_2015_Laurent. ',
				@lang = 'french'

EXEC sp_addmessage	@msgnum = 60003, @severity = 12,
				@msgtext = 'La clé primaire %s pour la table %s existe déjà dans la base de données Aeroport_2015_Laurent. %s',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60003, @severity = 12,
				@msgtext = 'La clé primaire %1! pour la table %2! existe déjà dans la base de données Aeroport_2015_Laurent. %3!',
				@lang = 'french'
GO