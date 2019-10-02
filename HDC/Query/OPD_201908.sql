SELECT SUM(CASE WHEN c.hostype = '06' THEN 1 ELSE 0 END) as 'รพ.ชุมพร'
	, sum(CASE WHEN c.hostype = '07' THEN 1 ELSE 0 END) as 'รพช.'
	, sum(CASE WHEN c.hostype = '08' THEN 1 ELSE 0 END) as '08'
	, sum(CASE WHEN c.hostype = '13' THEN 1 ELSE 0 END) as '13'
	, sum(CASE WHEN c.hostype = '18' THEN 1 ELSE 0 END) as 'รพ.สต.'
	, COUNT(DISTINCT s.HN)
FROM chospital as c INNER JOIN service as s ON c.hoscode = s.HOSPCODE 

WHERE left(s.DATE_SERV,7) = '2019-08'

GROUP BY s.HOSPCODE
ORDER BY c.hostype