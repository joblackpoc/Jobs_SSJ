SELECT SUM(CASE WHEN person.SEX = '1' THEN 1 ELSE 0 END) as 'male'
	,SUM(CASE WHEN person.SEX = '2' THEN 1 ELSE 0 END) as 'female'
	,COUNT(person.PID) as 'total'
FROM chronic
	LEFT JOIN person
	ON chronic.HOSPCODE = person.HOSPCODE
	AND chronic.CID = person.CID
	AND chronic.PID = person.PID
WHERE left(chronic.chronic ,3) BETWEEN 'i60' AND 'i69'
	AND person.TYPEAREA in(1,3)