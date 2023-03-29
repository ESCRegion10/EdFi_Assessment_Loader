--select t.*, t.rowid from MISD_IBC_REMOVAL t

select t.STUDENT_10_DIGIT_TSDS_UNIQU
    ,count(*)
from MISD_IBC_REMOVAL t
having count(*) > 1
group by t.STUDENT_10_DIGIT_TSDS_UNIQU

select  t.*, s.STUDENT_10_DIGIT_TSDS_UNIQU
from EDFI_STUDENT_CERTS t
join MISD_IBC_REMOVAL s on trim(s.STUDENT_10_DIGIT_TSDS_UNIQU) = t.STUDENT_UNIQUE_ID
where t.DISTRICT_ID = '057914'
and t.ACHIEVEMENT_TITLE = 'Google Analytics Individual Qualification'

select  t.*
from EDFI_STUDENT_CERTS t
where t.DISTRICT_ID = '057914'
and t.ACHIEVEMENT_TITLE = 'Google Analytics Individual Qualification'
and t.STUDENT_UNIQUE_ID in (select trim(s.STUDENT_10_DIGIT_TSDS_UNIQU) from MISD_IBC_REMOVAL s )

delete from EDFI_STUDENT_CERTS t
where t.DISTRICT_ID = '057914'
and t.ACHIEVEMENT_TITLE = 'Google Analytics Individual Qualification'
and t.STUDENT_UNIQUE_ID in (select trim(s.STUDENT_10_DIGIT_TSDS_UNIQU) from MISD_IBC_REMOVAL s )
