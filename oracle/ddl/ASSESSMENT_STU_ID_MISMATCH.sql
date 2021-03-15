-- Create table
create table ASSESSMENT_STU_ID_MISMATCH
(
  last_name       VARCHAR2(50),
  first_name      VARCHAR2(30),
  birth_date      VARCHAR2(10),
  loaded_date     DATE not null,
  district_id     VARCHAR2(6) not null,
  file_name       VARCHAR2(100) not null,
  assessment_type VARCHAR2(6) not null,
  student_id      VARCHAR2(10)
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
create index IX1_STU_ID_MISMATCH on ASSESSMENT_STU_ID_MISMATCH (FILE_NAME)
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
create index IX2_STU_ID_MISMATCH on ASSESSMENT_STU_ID_MISMATCH (DISTRICT_ID, FILE_NAME, ASSESSMENT_TYPE)
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
create index IX_ASSESSMENT_STU_ID_MISMATCH on ASSESSMENT_STU_ID_MISMATCH (DISTRICT_ID, LOADED_DATE, FILE_NAME)
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
