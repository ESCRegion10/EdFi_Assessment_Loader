-- Create table
create table IMPORTER_INGESTION_LOG
(
  "AgentId"        VARCHAR2(20),
  "FileName"       VARCHAR2(400),
  "Date"           VARCHAR2(40),
  "RowNumber"      VARCHAR2(20),
  "HttpStatusCode" VARCHAR2(20),
  "OdsResponse"    VARCHAR2(4000)
)
tablespace EDFI
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IX_IMPORTER_INGESTION_LOG on IMPORTER_INGESTION_LOG (FileName)
  tablespace EDFI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
