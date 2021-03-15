-- Create table
create table DISTRICT_ASSESSMENT_HEADER
(
  column_position INTEGER,
  column_name     VARCHAR2(50) not null,
  data_type       VARCHAR2(20),
  format_mask     VARCHAR2(20),
  created         DATE,
  district_id     VARCHAR2(6) not null,
  filename        VARCHAR2(100) not null,
  assessment_type VARCHAR2(6) not null
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
alter table DISTRICT_ASSESSMENT_HEADER
  add constraint PK_DIST_ASSESS_HDR primary key (COLUMN_NAME, DISTRICT_ID, FILENAME, ASSESSMENT_TYPE)
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
