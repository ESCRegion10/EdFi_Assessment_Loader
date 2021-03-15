-- Create table
create table DISTRICT_IB_DATA
(
  line_number     INTEGER not null,
  year            INTEGER,
  student_id      VARCHAR2(10),
  district_id     VARCHAR2(6) not null,
  school_session  VARCHAR2(30),
  subject         VARCHAR2(50),
  exam_grade      VARCHAR2(2),
  predicted_grade VARCHAR2(2),
  loaded_date     DATE,
  file_name       VARCHAR2(100) not null
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
alter table DISTRICT_IB_DATA
  add constraint PK_DISTRICT_IB_DATA primary key (LINE_NUMBER, DISTRICT_ID, FILE_NAME)
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
