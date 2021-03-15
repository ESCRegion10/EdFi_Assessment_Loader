-- Create table
create table DISTRICT_STANDARD_FILE_FORMAT
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
