SELECT hospcode
	,PID
	,(case when DIAGCODE in ('r119','r119','y433') then DIAGCODE else NULL end) as 'Nausia'
	,(case when (DIAGCODE between 'g400' and 'g409') or (DIAGCODE = 'y466') then DIAGCODE else NULL end) as 'Epilepsy'
	,(case when DIAGCODE in ('g800','g801','g802','g35','r252') then DIAGCODE else NULL end) as 'Muscle contraction'
	,(case when DIAGCODE LIKE 'm792%' then DIAGCODE else NULL end) as 'Nervous pain'

FROM tmp_diag_opd

WHERE HOSPCODE = "Your HOSPCODE" 
	OR (case when DIAGCODE in ('r119','r119','y433') then DIAGCODE else NULL end) is not NULL
	OR (case when (DIAGCODE between 'g400' and 'g409') or (DIAGCODE = 'y466') then DIAGCODE else NULL end) is not NULL
	OR (case when DIAGCODE in ('g800','g801','g802','g35','r252') then DIAGCODE else NULL end)
	OR (case when DIAGCODE LIKE 'm792%' then DIAGCODE else NULL end) is not NULL
