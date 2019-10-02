select hospcode 
,sum(case when DIAGCODE in ('r119','r119','y433') = 1 then 1 else 0 end) as 'ภาวะคลื่นไส้'
,sum(case when (DIAGCODE between 'g400' and 'g409') or (DIAGCODE = 'y466') = 1 then 1 else 0 end) as 'ลมชัก'
,sum(case when DIAGCODE in ('g800','g801','g802','g35','r252') = 1 then 1 else 0 end) as 'กล้ามเนื้อหดเกร็ง'
,sum(case when DIAGCODE LIKE 'm792%' = 1 then 1 else 0 end) as 'ภาวะปวดประสาท'
from tmp_diag_opd
GROUP BY HOSPCODE