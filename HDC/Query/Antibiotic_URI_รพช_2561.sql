SELECT left(s.DATE_SERV,7) as 'MONTH'
	,sum(s.COST) as 'COST'
	,sum(s.PRICE) as 'PRICE'

FROM chospital AS ch 
		LEFT JOIN service AS s ON ch.hoscode = s.HOSPCODE
		LEFT JOIN charge_opd AS c ON ch.hoscode = c.HOSPCODE AND c.HOSPCODE = s.HOSPCODE AND c.seq = s.seq and c.pid = s.pid and c.date_serv = s.date_serv
		LEFT JOIN drug_opd as d on d.HOSPCODE = ch.hoscode and d.HOSPCODE = s.HOSPCODE and d.HOSPCODE = c.HOSPCODE
			AND d.PID = s.PID AND d.pid = c.PID AND d.SEQ = s.seq and d.seq = c.seq and d.date_serv = c.date_serv and d.date_serv = s.date_serv
		LEFT JOIN diagnosis_opd as da ON da.HOSPCODE = ch.HOSCODE AND da.hospcode = c.hospcode AND da.hospcode = d.hospcode
			AND da.pid = s.pid AND da.pid = c.pid AND da.pid = d.pid AND da.seq = s.seq AND da.seq = c.seq AND da.seq = d.seq
			AND da.date_serv = s.date_serv AND da.date_serv = c.date_serv AND da.date_serv = d.date_serv
		
		
WHERE ch.hostype IN ('07')
	AND LEFT(s.DATE_SERV, 7) BETWEEN '2017-10' and '2018-09'
	AND d.DIDSTD IN ( '100176000004493120181506',	'100176000004293220181506',	'100176000000950330681555',	'100176000001170930681080', '210010310018543130681247', '210010310018388121781791', '124824000004293220181506', '124824000001100130681562', '100143000004121120381445', '100141105000950330681620', '100141270004293220381078')
	AND LEFT(da.DIAGCODE, 5) IN ('H65.0','H65.1','H65.9','H66.0','H66.4','H66.9', 'H67.0','H67.1','H67.8','H72.0','H72.1','H72.2','H72.8','H72.9','J00','J01.0','J01.1','J01.2','J01.3','J01.4','J01.8','J01.9', 'J02.0','J02.9','J03.0','J03.8','J03.9','J04.0','J04.1','J04.2','J05.0','J05.1','J06.0','J06.8','J06.9', 'J10.1','J11.1','J20.0','J20.1','J20.2','J20.3','J20.4','J20.5','J20.6','J20.7','J20.8','J20.9','J21.0','J21.8','J21.9')

GROUP BY LEFT(s.date_serv, 7)