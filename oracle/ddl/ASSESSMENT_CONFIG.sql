-- Create table
create table ASSESSMENT_CONFIG
(
  parameter_name        VARCHAR2(100),
  parameter_value       INTEGER,
  parameter_district_id VARCHAR2(6),
  parameter_comments    VARCHAR2(500)
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
create unique index UX_PARAM_NAME on ASSESSMENT_CONFIG (PARAMETER_NAME, PARAMETER_DISTRICT_ID)
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
