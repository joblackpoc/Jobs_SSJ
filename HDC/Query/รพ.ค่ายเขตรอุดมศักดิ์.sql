SELECT c.hoscode, c.hosname
		, COUNT(s.HN)

FROM chospital as c INNER JOIN service as s ON c.hoscode = s.HOSPCODE 

WHERE left(s.DATE_SERV,7) = '2019-07' AND c.hoscode = '11525'

GROUP BY c.hoscode
ORDER BY c.hostype