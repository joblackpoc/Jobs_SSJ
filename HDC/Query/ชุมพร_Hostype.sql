SELECT  DISTINCT c.hoscode, c.hostype, c.hosname, t.splevel , ct.hostypename, c.bed

FROM chospital as c LEFT JOIN chostype as ct ON c.hostype = ct.hostypecode
		LEFT JOIN t_cmi_service1 as t ON c.hoscode = t.hcode AND c.hosname = t.hname AND c.provcode = t.prov

WHERE  provcode = '86' AND hostype in ('06','07','08','12','13','18')

ORDER BY hostype, hoscode