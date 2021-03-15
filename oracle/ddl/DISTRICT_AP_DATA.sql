-- Create table
create table DISTRICT_AP_DATA
(
  line_number    INTEGER not null,
  last_name      VARCHAR2(50) not null,
  first_name     VARCHAR2(30) not null,
  middle_initial VARCHAR2(2),
  birth_date     VARCHAR2(10) not null,
  admin_year_01  DATE,
  exam_code_01   VARCHAR2(3),
  exam_score_01  VARCHAR2(2),
  admin_year_02  DATE,
  exam_code_02   VARCHAR2(3),
  exam_score_02  VARCHAR2(2),
  admin_year_03  DATE,
  exam_code_03   VARCHAR2(3),
  exam_score_03  VARCHAR2(2),
  admin_year_04  DATE,
  exam_code_04   VARCHAR2(3),
  exam_score_04  VARCHAR2(2),
  admin_year_05  DATE,
  exam_code_05   VARCHAR2(3),
  exam_score_05  VARCHAR2(2),
  admin_year_06  DATE,
  exam_code_06   VARCHAR2(3),
  exam_score_06  VARCHAR2(2),
  admin_year_07  DATE,
  exam_code_07   VARCHAR2(3),
  exam_score_07  VARCHAR2(2),
  admin_year_08  DATE,
  exam_code_08   VARCHAR2(3),
  exam_score_08  VARCHAR2(2),
  admin_year_09  DATE,
  exam_code_09   VARCHAR2(3),
  exam_score_09  VARCHAR2(2),
  admin_year_10  DATE,
  exam_code_10   VARCHAR2(3),
  exam_score_10  VARCHAR2(2),
  loaded_date    DATE not null,
  district_id    VARCHAR2(6) not null,
  file_name      VARCHAR2(100) not null
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
alter table DISTRICT_AP_DATA
  add constraint PK_DISTRICT_AP_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
