-- Create table
create table IMPORTER_FILES_LOG
(
  "Id"         VARCHAR2(20),
  "AgentId"    VARCHAR2(20),
  "FileName"   VARCHAR2(400),
  "Status"     VARCHAR2(20),
  "Message"    VARCHAR2(4000),
  "Rows"       VARCHAR2(20),
  "CreateDate" VARCHAR2(40)
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
create index IX_IMPORTER_FILES_LOG on IMPORTER_FILES_LOG (FileName)
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
