-- Create table
create table DISTRICT_TSI2_DATA
(
  line_number          INTEGER not null,
  test_start           DATE not null,
  last_name            VARCHAR2(50) not null,
  first_name           VARCHAR2(30) not null,
  middle_initial       VARCHAR2(30),
  student_id           VARCHAR2(10),
  birth_date           VARCHAR2(10) not null,
  site_id              VARCHAR2(40),
  inst_id              VARCHAR2(40),
  tsi2_math_readiness  VARCHAR2(20),
  tsi2_math_diagnostic VARCHAR2(20),
  tsi2_elar_readiness  VARCHAR2(20),
  tsi2_elar_diagnostic VARCHAR2(20),
  tsi2_elar_essay      VARCHAR2(20),
  district_id          VARCHAR2(6) not null,
  file_name            VARCHAR2(100) not null,
  loaded_date          DATE default sysdate not null,
  supplemental_id      VARCHAR2(10)
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table DISTRICT_TSI2_DATA
  add constraint PK_DISTRICT_TSI2_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
  using index 
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
-- Create/Recreate check constraints 
alter table DISTRICT_TSI2_DATA
  add constraint CHK_ELAR_DIAG_SCORE
  check (to_number(tsi2_elar_diagnostic) between 1 and 6);
alter table DISTRICT_TSI2_DATA
  add constraint CHK_ELAR_ESSAY_SCORE
  check (to_number(tsi2_elar_essay) between 1 and 8);
alter table DISTRICT_TSI2_DATA
  add constraint CHK_ELAR_READY_SCORE
  check (to_number(tsi2_elar_readiness) between 910 and 990);
alter table DISTRICT_TSI2_DATA
  add constraint CHK_MATH_DIAG_SCORE
  check (to_number(tsi2_math_diagnostic) between 1 and 6);
alter table DISTRICT_TSI2_DATA
  add constraint CHK_MATH_READY_SCORE
  check (to_number(tsi2_math_readiness) between 910 and 990);
