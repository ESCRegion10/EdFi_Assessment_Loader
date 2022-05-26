create or replace force view edfidata.v_importer_files_log as
select "Id"
      ,"AgentId"
      ,"FileName"
      ,"Status"
      ,"Message"
      ,"Rows"
      ,"CreateDate"
from edfidata.importer_files_log;
grant select on EDFIDATA.V_IMPORTER_FILES_LOG to EDFIAPP;


