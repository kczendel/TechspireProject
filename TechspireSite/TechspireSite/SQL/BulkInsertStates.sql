BULK INSERT StateProvince
FROM "D:\Dev\Python\TechspireProject\TechspireSite\TechspireSite\SQL\Data\StateList.csv"
WITH
	(
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n',
	KEEPIDENTITY
	)
GO