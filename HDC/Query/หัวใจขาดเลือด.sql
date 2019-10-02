SELECT COUNT(person.PID) as 'total'
	,SUM(CASE WHEN person.SEX = '1' THEN 1 ELSE 0 END) as 'male'
	,SUM(CASE WHEN person.SEX = '2' THEN 1 ELSE 0 END) as 'female'
	
FROM chronic
	LEFT JOIN person
	ON chronic.HOSPCODE = person.HOSPCODE
	AND chronic.CID = person.CID
	AND chronic.PID = person.PID
WHERE left(chronic.chronic ,3) BETWEEN 'i00' AND 'i09'
	OR left(chronic.chronic ,3) BETWEEN 'i20' AND 'i28'
	OR left(chronic.chronic ,3) BETWEEN 'i30' AND 'i52'
