SELECT c.distcode
		, COUNT(DISTINCT s.PID)

FROM chospital as c INNER JOIN service as s ON c.hoscode = s.HOSPCODE 

WHERE left(s.DATE_SERV,7) = '2019-07'

GROUP BY c.distcode
ORDER BY c.distcode