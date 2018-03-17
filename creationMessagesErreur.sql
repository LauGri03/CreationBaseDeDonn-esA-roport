USE Aeroport_2015_Laurent
GO

EXEC sp_addmessage	@msgnum = 60001, @severity = 12,
				@msgtext = 'La table %s existe d�j� dans la base de donn�es Aeroport_2015_Laurent. %s',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60001, @severity = 12,
				@msgtext = 'La table %1! existe d�j� dans la base de donn�es Aeroport_2015_Laurent.%2!',
				@lang = 'french'

EXEC sp_addmessage	@msgnum = 60002, @severity = 12,
				@msgtext = 'Le sch�ma %s n''existe pas dans la base de donn�es Aeroport_2015_Laurent.',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60002, @severity = 12,
				@msgtext = 'Le sch�ma %1! n''existe pas dans la base de donn�es Aeroport_2015_Laurent. ',
				@lang = 'french'

EXEC sp_addmessage	@msgnum = 60003, @severity = 12,
				@msgtext = 'La cl� primaire %s pour la table %s existe d�j� dans la base de donn�es Aeroport_2015_Laurent. %s',
				@lang = 'us_english'
				
EXEC sp_addmessage	@msgnum = 60003, @severity = 12,
				@msgtext = 'La cl� primaire %1! pour la table %2! existe d�j� dans la base de donn�es Aeroport_2015_Laurent. %3!',
				@lang = 'french'
GO