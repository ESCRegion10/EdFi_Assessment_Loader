-- create directory newest version
-- run as 'SYS'

create or replace directory GARLAND_ACT_OUT_DIR as '/home/edfi/data/057909/ACT';
create or replace directory GARLAND_AP_OUT_DIR as '/home/edfi/data/057909/AP';
create or replace directory GARLAND_SAT_OUT_DIR as '/home/edfi/data/057909/SAT';
create or replace directory GARLAND_TSI_OUT_DIR as '/home/edfi/data/057909/TSI';
create or replace directory GARLAND_IB_OUT_DIR as '/home/edfi/data/057909/IB';

create or replace directory CEDAR_HILL_ACT_OUT_DIR as '/home/edfi/data/057904/ACT';
create or replace directory CEDAR_HILL_AP_OUT_DIR as '/home/edfi/data/057904/AP';
create or replace directory CEDAR_HILL_SAT_OUT_DIR as '/home/edfi/data/057904/SAT';
create or replace directory CEDAR_HILL_TSI_OUT_DIR as '/home/edfi/data/057904/TSI';
create or replace directory CEDAR_HILL_IB_OUT_DIR as '/home/edfi/data/057904/IB';

create or replace directory DUNCANVILLE_ACT_OUT_DIR as '/home/edfi/data/057907/ACT';
create or replace directory DUNCANVILLE_AP_OUT_DIR as '/home/edfi/data/057907/AP';
create or replace directory DUNCANVILLE_SAT_OUT_DIR as '/home/edfi/data/057907/SAT';
create or replace directory DUNCANVILLE_TSI_OUT_DIR as '/home/edfi/data/057907/TSI';
create or replace directory DUNCANVILLE_IB_OUT_DIR as '/home/edfi/data/057907/IB';

create or replace directory GRAND_PRAIRIE_ACT_OUT_DIR as '/home/edfi/data/057910/ACT'; 
create or replace directory GRAND_PRAIRIE_AP_OUT_DIR as '/home/edfi/data/057910/AP';  
create or replace directory GRAND_PRAIRIE_SAT_OUT_DIR as '/home/edfi/data/057910/SAT';  
create or replace directory GRAND_PRAIRIE_TSI_OUT_DIR as '/home/edfi/data/057910/TSI';  
create or replace directory GRAND_PRAIRIE_IB_OUT_DIR as '/home/edfi/data/057910/IB';  

create or replace directory RICHARDSON_ACT_OUT_DIR as '/home/edfi/data/057916/ACT';
create or replace directory RICHARDSON_AP_OUT_DIR as '/home/edfi/data/057916/AP';
create or replace directory RICHARDSON_SAT_OUT_DIR as '/home/edfi/data/057916/SAT';
create or replace directory RICHARDSON_TSI_OUT_DIR as '/home/edfi/data/057916/TSI';
create or replace directory RICHARDSON_IB_OUT_DIR as '/home/edfi/data/057916/IB';

create or replace directory MESQUITE_ACT_OUT_DIR as '/home/edfi/data/057914/ACT';
create or replace directory MESQUITE_AP_OUT_DIR as '/home/edfi/data/057914/AP';
create or replace directory MESQUITE_SAT_OUT_DIR as '/home/edfi/data/057914/SAT';
create or replace directory MESQUITE_TSI_OUT_DIR as '/home/edfi/data/057914/TSI';
create or replace directory MESQUITE_IB_OUT_DIR as '/home/edfi/data/057914/IB';

create or replace directory WAXAHACHIE_ACT_OUT_DIR as '/home/edfi/data/070912/ACT';
create or replace directory WAXAHACHIE_AP_OUT_DIR as '/home/edfi/data/070912/AP';
create or replace directory WAXAHACHIE_SAT_OUT_DIR as '/home/edfi/data/070912/SAT';
create or replace directory WAXAHACHIE_TSI_OUT_DIR as '/home/edfi/data/070912/TSI';
create or replace directory WAXAHACHIE_IB_OUT_DIR as '/home/edfi/data/070912/IB';

create or replace directory FERRIS_ACT_OUT_DIR as '/home/edfi/data/070905/ACT';
create or replace directory FERRIS_AP_OUT_DIR as '/home/edfi/data/070905/AP';
create or replace directory FERRIS_SAT_OUT_DIR as '/home/edfi/data/070905/SAT';
create or replace directory FERRIS_TSI_OUT_DIR as '/home/edfi/data/070905/TSI';
create or replace directory FERRIS_IB_OUT_DIR as '/home/edfi/data/070905/IB';

create or replace directory FORNEY_ACT_OUT_DIR as '/home/edfi/data/129902/ACT';
create or replace directory FORNEY_AP_OUT_DIR as '/home/edfi/data/129902/AP';
create or replace directory FORNEY_SAT_OUT_DIR as '/home/edfi/data/129902/SAT';
create or replace directory FORNEY_TSI_OUT_DIR as '/home/edfi/data/129902/TSI';
create or replace directory FORNEY_IB_OUT_DIR as '/home/edfi/data/129902/IB';

create or replace directory COMMERCE_ACT_OUT_DIR as '/home/edfi/data/116903/ACT';
create or replace directory COMMERCE_AP_OUT_DIR as '/home/edfi/data/116903/AP';
create or replace directory COMMERCE_SAT_OUT_DIR as '/home/edfi/data/116903/SAT';
create or replace directory COMMERCE_TSI_OUT_DIR as '/home/edfi/data/116903/TSI';
create or replace directory COMMERCE_IB_OUT_DIR as '/home/edfi/data/116903/IB';

create or replace directory CRANDALL_ACT_OUT_DIR as '/home/edfi/data/129901/ACT';
create or replace directory CRANDALL_AP_OUT_DIR as '/home/edfi/data/129901/AP';
create or replace directory CRANDALL_SAT_OUT_DIR as '/home/edfi/data/129901/SAT';
create or replace directory CRANDALL_TSI_OUT_DIR as '/home/edfi/data/129901/TSI';
create or replace directory CRANDALL_IB_OUT_DIR as '/home/edfi/data/129901/IB';

-- add directory to DISTRICT_OUTPUT_DIR
-- run as 'EDFIDATA'
insert into DISTRICT_OUTPUT_DIR values ('057909', 'GARLAND_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057909', 'GARLAND_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057909', 'GARLAND_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057909', 'GARLAND_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057909', 'GARLAND_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('057904', 'CEDAR_HILL_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057904', 'CEDAR_HILL_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057904', 'CEDAR_HILL_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057904', 'CEDAR_HILL_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057904', 'CEDAR_HILL_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('057907', 'DUNCANVILLE_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057907', 'DUNCANVILLE_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057907', 'DUNCANVILLE_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057907', 'DUNCANVILLE_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057907', 'DUNCANVILLE_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('057910', 'GRAND_PRAIRIE_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057910', 'GRAND_PRAIRIE_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057910', 'GRAND_PRAIRIE_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057910', 'GRAND_PRAIRIE_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057910', 'GRAND_PRAIRIE_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('057916', 'RICHARDSON_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057916', 'RICHARDSON_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057916', 'RICHARDSON_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057916', 'RICHARDSON_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057916', 'RICHARDSON_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('057914', 'MESQUITE_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('057914', 'MESQUITE_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('057914', 'MESQUITE_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('057914', 'MESQUITE_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('057914', 'MESQUITE_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('070912', 'WAXAHACHIE_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('070912', 'WAXAHACHIE_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('070912', 'WAXAHACHIE_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('070912', 'WAXAHACHIE_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('070912', 'WAXAHACHIE_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('070905', 'FERRIS_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('070905', 'FERRIS_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('070905', 'FERRIS_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('070905', 'FERRIS_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('070905', 'FERRIS_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('129902', 'FORNEY_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('129902', 'FORNEY_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('129902', 'FORNEY_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('129902', 'FORNEY_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('129902', 'FORNEY_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('116903', 'COMMERCE_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('116903', 'COMMERCE_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('116903', 'COMMERCE_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('116903', 'COMMERCE_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('116903', 'COMMERCE_TSI_OUT_DIR', sysdate, 'TSI');

insert into DISTRICT_OUTPUT_DIR values ('129901', 'CRANDALL_ACT_OUT_DIR', sysdate, 'ACT');
insert into DISTRICT_OUTPUT_DIR values ('129901', 'CRANDALL_AP_OUT_DIR', sysdate, 'AP');
insert into DISTRICT_OUTPUT_DIR values ('129901', 'CRANDALL_IB_OUT_DIR', sysdate, 'IB');
insert into DISTRICT_OUTPUT_DIR values ('129901', 'CRANDALL_SAT_OUT_DIR', sysdate, 'SAT');
insert into DISTRICT_OUTPUT_DIR values ('129901', 'CRANDALL_TSI_OUT_DIR', sysdate, 'TSI');

-- grants on directory
-- run as 'EDFIDATA'
GRANT READ, WRITE ON DIRECTORY GARLAND_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GARLAND_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GARLAND_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GARLAND_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY GARLAND_TSI_OUT_DIR TO PUBLIC; 

GRANT READ, WRITE ON DIRECTORY CEDAR_HILL_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CEDAR_HILL_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CEDAR_HILL_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CEDAR_HILL_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY CEDAR_HILL_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY DUNCANVILLE_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY DUNCANVILLE_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY DUNCANVILLE_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY DUNCANVILLE_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY DUNCANVILLE_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY GRAND_PRAIRIE_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GRAND_PRAIRIE_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GRAND_PRAIRIE_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY GRAND_PRAIRIE_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY GRAND_PRAIRIE_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY RICHARDSON_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY RICHARDSON_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY RICHARDSON_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY RICHARDSON_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY RICHARDSON_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY MESQUITE_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY MESQUITE_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY MESQUITE_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY MESQUITE_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY MESQUITE_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY WAXAHACHIE_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY WAXAHACHIE_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY WAXAHACHIE_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY WAXAHACHIE_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY WAXAHACHIE_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY FERRIS_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FERRIS_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FERRIS_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FERRIS_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY FERRIS_TSI_OUT_DIR TO PUBLIC;
 
GRANT READ, WRITE ON DIRECTORY FORNEY_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FORNEY_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FORNEY_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY FORNEY_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY FORNEY_TSI_OUT_DIR TO PUBLIC;

GRANT READ, WRITE ON DIRECTORY COMMERCE_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY COMMERCE_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY COMMERCE_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY COMMERCE_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY COMMERCE_TSI_OUT_DIR TO PUBLIC;
 
GRANT READ, WRITE ON DIRECTORY CRANDALL_ACT_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CRANDALL_AP_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CRANDALL_IB_OUT_DIR TO PUBLIC; 
GRANT READ, WRITE ON DIRECTORY CRANDALL_SAT_OUT_DIR TO PUBLIC;
GRANT READ, WRITE ON DIRECTORY CRANDALL_TSI_OUT_DIR TO PUBLIC;

  
  
 
 
