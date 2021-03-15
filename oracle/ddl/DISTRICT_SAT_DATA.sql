-- Create table
create table DISTRICT_SAT_DATA
(
  ai_code                 VARCHAR2(10) not null,
  last_name               VARCHAR2(50) not null,
  first_name              VARCHAR2(30) not null,
  name_mi                 VARCHAR2(1),
  birth_date              VARCHAR2(10) not null,
  latest_sat_total        VARCHAR2(4),
  latest_sat_ebrw         VARCHAR2(4),
  latest_sat_math_section VARCHAR2(4),
  latest_registration_num VARCHAR2(10),
  latest_assessment_date  DATE,
  loaded_date             DATE default SYSDATE not null,
  district_id             VARCHAR2(6) not null,
  file_name               VARCHAR2(100) not null,
  line_number             NUMBER not null,
  secondary_id            VARCHAR2(15)
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
create index IX_SECONDARY_ID on DISTRICT_SAT_DATA (SECONDARY_ID)
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table DISTRICT_SAT_DATA
  add constraint PK_DISTRICT_SAT_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
