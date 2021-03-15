-- Create table
create table ASSESSMENT_STD_FILE_FORMAT
(
  column_position INTEGER,
  column_name     VARCHAR2(50),
  standard_type   VARCHAR2(10),
  created         DATE default sysdate
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
create unique index UIX_ASSESSMENT_STD_FILE_FORMAT on ASSESSMENT_STD_FILE_FORMAT (COLUMN_POSITION, COLUMN_NAME, STANDARD_TYPE)
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
