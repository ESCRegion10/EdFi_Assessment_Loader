-- Create table
create table DISTRICT_DB_LINK
(
  district_id VARCHAR2(6) not null,
  db_link     VARCHAR2(100) not null,
  created     DATE default sysdate,
  target_db   VARCHAR2(10) not null
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
alter table DISTRICT_DB_LINK
  add constraint PK_DISTRICT_DB_LINK primary key (DISTRICT_ID, TARGET_DB)
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
