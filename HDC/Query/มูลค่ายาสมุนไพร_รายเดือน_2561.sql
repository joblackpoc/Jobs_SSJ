SELECT left(s.DATE_SERV,7)  AS 'MONTH'
			, SUM(CASE WHEN d.DIDSTD = '410000000479150020111376' THEN s.COST	ELSE 0 END) AS  'cost ฟ้าทะลายโจร' 
			, SUM(CASE WHEN d.DIDSTD = '410000000109150020111376' THEN s.COST	ELSE 0 END) AS 'cost ขมิ้นชันแคปซูล'
			, SUM(CASE WHEN d.DIDSTD = '420000005300000020311376' THEN s.COST	ELSE 0 END) AS 'cost ยาเหลืองปิดสมุทร' 
			, SUM(CASE WHEN d.DIDSTD = '410000000479150020111376' THEN s.PRICE	ELSE 0 END) AS  'price ฟ้าทะลายโจร' 
			, SUM(CASE WHEN d.DIDSTD = '410000000109150020111376' THEN s.PRICE	ELSE 0 END) AS 'price ขมิ้นชันแคปซูล'
			, SUM(CASE WHEN d.DIDSTD = '420000005300000020311376' THEN s.PRICE	ELSE 0 END) AS 'price ยาเหลืองปิดสมุทร' 
			, SUM(CASE WHEN d.DIDSTD = '410000000479150020111376' THEN s.PAYPRICE	ELSE 0 END) AS  'payprice ฟ้าทะลายโจร' 
			, SUM(CASE WHEN d.DIDSTD = '410000000109150020111376' THEN s.PAYPRICE	ELSE 0 END) AS 'payprice ขมิ้นชันแคปซูล'
			, SUM(CASE WHEN d.DIDSTD = '420000005300000020311376' THEN s.PAYPRICE	ELSE 0 END) AS 'payprice ยาเหลืองปิดสมุทร' 

FROM charge_opd as co 
	LEFT JOIN service as s ON co.hospcode = s.hospcode
		AND co.pid = s.pid AND co.SEQ = s.SEQ AND co.date_serv = s.date_serv
	LEFT JOIN drug_opd as d ON co.hospcode = d.hospcode AND co.pid = d.PID AND co.seq = d.seq AND co.date_serv = d.date_serv
		AND s.hospcode = d.hospcode AND s.pid = d.pid and s.seq = d.seq and s.date_serv = d.date_serv

WHERE co.date_serv BETWEEN '2017-10-01' AND '2018-09-30'
	AND d.DIDSTD IN('420000005300000020311376','410000000109150020111376','420000005300000020311376')
	
GROUP BY left(s.DATE_SERV,7)