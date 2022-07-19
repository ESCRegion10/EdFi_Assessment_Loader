create or replace force view edfidata.v_importer_ingestion_log as
select "AgentId",
       "FileName",
       "Date",
       "RowNumber",
       "HttpStatusCode",
       "OdsResponse"
from edfidata.importer_ingestion_log;
grant select on EDFIDATA.V_IMPORTER_INGESTION_LOG to EDFIAPP;


