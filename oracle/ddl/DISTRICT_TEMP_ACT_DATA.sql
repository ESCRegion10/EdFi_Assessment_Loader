-- Create table
create table DISTRICT_TEMP_ACT_DATA
(
  data_record CLOB,
  loaded_date DATE,
  district_id VARCHAR2(6) not null,
  file_name   VARCHAR2(100) not null,
  line_number NUMBER not null
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
alter table DISTRICT_TEMP_ACT_DATA
  add constraint PK_DISTRICT_TEMP_ACT_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
