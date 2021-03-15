-- Create table
create table ASSESSMENT_FILE_FORMAT
(
  assessment_type   VARCHAR2(10) not null,
  assessment_header VARCHAR2(4000) not null,
  assessment_year   VARCHAR2(4) not null,
  create_date       DATE default sysdate
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
