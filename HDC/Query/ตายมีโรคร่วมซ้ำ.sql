SELECT death.HOSPCODE,chospital.hosname, death.HOSPDEATH
	, death.PID
	, death.CID
	, CONCAT(left(person.NAME,2),'xx',RIGHT(person.NAME,2)) as 'NAME'
	, CONCAT(left(person.LNAME,2),'xx',RIGHT(person.LNAME,2)) as 'LNAME'
	, person.NATION
	, person.TYPEAREA
	, person.BIRTH
	, left(death.DDEATH,10) as 'Dead Date'
	, death.CDEATH
	, death.CDEATH_A
	, death.CDEATH_B
	, death.CDEATH_C
	, death.CDEATH_D
	, death.D_UPDATE

FROM death inner JOIN person ON death.PID = person.PID
		AND death.CID = person.CID
		AND death.HOSPCODE = person.HOSPCODE
	INNER JOIN chospital ON chospital.hoscode = person.HOSPCODE
		AND chospital.hoscode = death.HOSPCODE

WHERE death.CDEATH IS NOT NULL
	AND death.CDEATH_A is NOT NULL
	AND death.CDEATH_B is NOT NULL
	AND death.CDEATH_C is NOT NULL
	AND death.CDEATH_D is NOT NULL
	AND death.CDEATH NOT IN ('r54', 'r55')
	AND left(death.DDEATH, 4) IS NOT NULL
	OR death.CDEATH IS NULL
ORDER BY death.HOSPCODE, death.D_UPDATE, death.DDEATH


	