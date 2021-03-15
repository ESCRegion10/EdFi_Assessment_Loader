-- Create table
create table DISTRICT_OUTPUT_DIR
(
  district_id      VARCHAR2(6) not null,
  output_directory VARCHAR2(100) not null,
  created          DATE default sysdate,
  test_type        VARCHAR2(10) not null
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
alter table DISTRICT_OUTPUT_DIR
  add constraint PK_DISTRICT_OUTPUT_DIR primary key (DISTRICT_ID, TEST_TYPE)
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
