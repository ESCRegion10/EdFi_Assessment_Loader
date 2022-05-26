CREATE OR REPLACE FORCE VIEW EDFIDATA.V_USER_CAMPUS_LIST AS
SELECT
 USER_ACCOUNT.USER_SID
,USER_ACCOUNT.USER_ID
,NVL(CAMPUS.CAMPUS_SID,-999) AS CAMPUS_SID
,CAMPUS.CAMPUS_CDC
,CAMPUS.CAMPUS_NAME
FROM USER_ACCOUNT
LEFT JOIN USER_CAMPUS ON USER_ACCOUNT.USER_SID = USER_CAMPUS.USER_SID
LEFT JOIN R10INTDATA.CAMPUS_DIM CAMPUS ON USER_CAMPUS.CAMPUS_SID = CAMPUS.CAMPUS_SID
WHERE USER_ACCOUNT.USER_SID = V('G_USER_SID')
/*==============================================
Purpose: this view is used to strictly for returning
         the data returned from another view to
         the users selected campuses.
===============================================*/;
grant select on EDFIDATA.V_USER_CAMPUS_LIST to EDFIAPP;


