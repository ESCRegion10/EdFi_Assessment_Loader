-- Create table
create table ASSESSMENT_TEST_COLS
(
  test_type   VARCHAR2(20) not null,
  column_nbr  INTEGER not null,
  column_name VARCHAR2(50) not null
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
create unique index UI1_ASSESSMENT_TEST_COLS on ASSESSMENT_TEST_COLS (TEST_TYPE, COLUMN_NBR, COLUMN_NAME)
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
