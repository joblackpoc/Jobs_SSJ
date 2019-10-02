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
	AND d.DIDSTD IN ('21000500018320120381445','21000500017408130481506','100179000004021220381247','100179000004410220381445','100180000004493120381445')
	AND LEFT(da.DIAGCODE, 5) IN ('A00.0','A00.1','A00.9','A02.0','A03.0','A03.1','A03.2','A03.3','A03.8','A03.9','A04.0','A04.1','A04.2','A04.3','A04.4','A04.5','A04.6','A04.7','A04.8','A04.9','A05.0', 'A05.3','A05.4','A05.9','A08.0','A08.1','A08.2','A08.3','A08.4','A08.5','A09.0','A09.9','K52.1','K52.8','K52.9')

GROUP BY LEFT(s.date_serv, 7)