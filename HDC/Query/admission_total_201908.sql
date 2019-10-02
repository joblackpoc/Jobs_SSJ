SELECT 
	  a.hospcode
	, c.hosname
	, count(DISTINCT a.pid) as 'Total'

FROM admission as a INNER JOIN chospital c ON a.hospcode = c.hoscode

WHERE left(a.DATETIME_ADMIT,7) = '2019-08'

GROUP BY a.HOSPCODE

