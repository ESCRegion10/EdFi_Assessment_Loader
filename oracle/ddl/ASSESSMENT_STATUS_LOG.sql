-- Create table
create table ASSESSMENT_STATUS_LOG
(
  log_id         NUMBER generated always as identity,
  created        TIMESTAMP(6) WITH LOCAL TIME ZONE not null,
  created_by     VARCHAR2(100) not null,
  statuscode     INTEGER not null,
  callstack      VARCHAR2(4000),
  errorstack     VARCHAR2(4000),
  backtrace      VARCHAR2(4000),
  status_message VARCHAR2(4000) not null,
  status_type    VARCHAR2(10),
  user_id        VARCHAR2(100)
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
create unique index UIX_ASSESSMENT_STATUS_LOG on ASSESSMENT_STATUS_LOG (CREATED, CREATED_BY)
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
