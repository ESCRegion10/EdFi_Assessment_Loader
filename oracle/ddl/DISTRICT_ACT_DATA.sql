-- Create table
create table DISTRICT_ACT_DATA
(
  other_id                   VARCHAR2(10),
  line_number                NUMBER not null,
  last_name                  VARCHAR2(50) not null,
  first_name                 VARCHAR2(30) not null,
  mid_init                   VARCHAR2(1),
  gender                     VARCHAR2(1),
  birth_date                 VARCHAR2(10) not null,
  act_scale_scores_composite VARCHAR2(2),
  act_scale_scores_english   VARCHAR2(2),
  act_scale_scores_math      VARCHAR2(2),
  act_scale_scores_reading   VARCHAR2(2),
  act_scale_scores_science   VARCHAR2(2),
  test_date_month_and_year   VARCHAR2(10),
  grade_level                VARCHAR2(2),
  loaded_date                DATE default sysdate,
  district_id                VARCHAR2(6) not null,
  file_name                  VARCHAR2(100) not null
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
alter table DISTRICT_ACT_DATA
  add constraint PK_DISTRICT_ACT_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
