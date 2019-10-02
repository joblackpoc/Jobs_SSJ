SELECT c.hoscode, c.hosname
		, COUNT(DISTINCT s.PID) as 'Total'

FROM chospital as c INNER JOIN service as s ON c.hoscode = s.HOSPCODE 

WHERE left(s.DATE_SERV,7) = '2019-08' AND c.hostype IN ('06','07','12')

GROUP BY c.hoscode
ORDER BY c.hostype