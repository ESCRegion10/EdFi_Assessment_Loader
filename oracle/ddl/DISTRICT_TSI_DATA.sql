-- Create table
create table DISTRICT_TSI_DATA
(
  line_number                 INTEGER not null,
  test_start                  DATE,
  last_name                   VARCHAR2(50),
  first_name                  VARCHAR2(30),
  middle_initial              VARCHAR2(30),
  student_id                  VARCHAR2(10),
  birth_date                  VARCHAR2(10),
  site_id                     VARCHAR2(40),
  inst_id                     VARCHAR2(40),
  tsi_mathematics_placement   VARCHAR2(20),
  tsi_reading_placement       VARCHAR2(20),
  tsi_writing_placement       VARCHAR2(20),
  tsi_writeplacer             VARCHAR2(20),
  abe_mathematics_diagnostics VARCHAR2(20),
  abe_writing_diagnostics     VARCHAR2(20),
  abe_reading_diagnostics     VARCHAR2(20),
  district_id                 VARCHAR2(6) not null,
  file_name                   VARCHAR2(100) not null,
  loaded_date                 DATE default sysdate
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
alter table DISTRICT_TSI_DATA
  add constraint PK_DISTRICT_TSI_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
alter table DISTRICT_TSI_DATA
  add constraint CHK_MATH_SCORE
  check (to_number(tsi_mathematics_placement) < 400);
alter table DISTRICT_TSI_DATA
  add constraint CHK_READING_SCORE
  check (to_number(tsi_reading_placement) < 400);
alter table DISTRICT_TSI_DATA
  add constraint CHK_WRITEPLACER_SCORE
  check (to_number(tsi_writeplacer) < 400);
alter table DISTRICT_TSI_DATA
  add constraint CHK_WRITING_SCORE
  check (to_number(tsi_writing_placement) < 400);
