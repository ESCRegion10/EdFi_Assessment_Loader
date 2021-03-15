-- Create table
create table DISTRICT_SAT_FILE_FIELDS
(
  column_position INTEGER,
  column_name     VARCHAR2(50),
  data_type       VARCHAR2(20),
  format_mask     VARCHAR2(20),
  created         DATE default sysdate,
  district_id     VARCHAR2(6),
  filename        VARCHAR2(100)
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
