#!/bin/bash

#-----------------------------------------------------------------------------------------------
#
# Script: edfi_district_setup.sh
#
# Purpose: to automate, for a district, the creation an ODBC Gateway for Ed-Fi
#
# Usage: edfi_district_setup.sh
#
# Assumptions: (1) both the ODS and ODS_IMPORT SQL Server databases exist
#
# Revision History:
# Date          Author          Remarks
# 6/1/21        T. Esposito     original version
# 6/25/21	T. Esposito	tested in dev.
#
#-----------------------------------------------------------------------------------------------

# setup environment variables
LOGDIR=/root/scripts/logs
LOGFILE=${LOGDIR}/edfi_district_setup.log
ORACLE_HOME=/u01/app/oracle/12.1/db_1
TNS_HOME=$ORACLE_HOME/network/admin
TNS_BIN=$ORACLE_HOME/bin

# verify log directory exists
if [ ! -d "${LOGDIR}" ]
then
  mkdir ${LOGDIR}
fi

# clear logfile
: > $LOGFILE

# user menu
while true
do
  clear
  echo -n "Enter district id: "
  read district_id
  echo $district_id >> $LOGFILE
  echo -n "Enter district name: "
  read district_name
  district_name=${district_name,,}
  echo $district_name >> $LOGFILE
  echo -n "Enter Oracle SYS password: "
  read orapw
  echo -n "Enter Oracle EDFIDATA password: "
  read edfidatapw
  echo -n "Enter SQL Server EDFI_STATS password: "
  read edfistatspw

  clear
  echo "------------------------------------------------"
  echo "District id: ${district_id}"
  echo "District name: ${district_name}"
  echo "Oracle SYS password: ${orapw}"
  echo "Oracle EDFIDATA password: ${edfidatapw}"
  echo "SQL Server EDFI_STATS password: ${edfistatspw}"
  echo "------------------------------------------------"
  echo ""
  echo -n "Does the above input look correct [y/N]: "
  read response

  case "$response" in
    [yY][eE][sS]|[yY]) break ;;
    [nN][oO]|[nN]) echo "Ok, try again ..."
       sleep 2 ;;
    *) echo "Error: Invalid response input ..."
       sleep 2 ;;
  esac
done

echo -n "Precheck ..."

if [ "$(id -u)" != "0" ]
then
  echo "Error: This script must be run as root" 
  exit 1
fi

if [ ${#district_id} -ne 6 ]
then
  echo "Error: You need to enter a district id of 6 digits"
  exit 2
fi

if ! [[ "${district_id}" =~ ^[0-9]+$ ]]
then
  echo "Error: You need to enter a district id that contains only numbers"
  exit 3
fi

if test -z ${district_name}
then
  echo "Error: You need to enter a district name"
  exit 4
fi

echo " ok"

# Get highest used port and calculate next 2 ports to be used

current_port=$(grep "PORT = " $TNS_HOME/listener.ora | cut -d' ' -f15 | cut -c1-4 | sort -run | head -1) 2>>${LOGFILE}
port1=`expr $current_port + 1` 2>>${LOGFILE}
port2=`expr $port1 + 1` 2>>${LOGFILE}

echo -n "Creating Linux directories ..."

cd /home/edfi/data 2>>${LOGFILE}
for dir in ACT AP IB SAT TSI TSI2
do
  mkdir -p ./${district_id}/${dir} 2>>${LOGFILE}
done

cd /home/edfi/data 2>>${LOGFILE}
chmod -R 777 ./${district_id} 2>>${LOGFILE}
chown -R edfi:edfi ./${district_id} 2>>${LOGFILE}

echo " ok"

echo -n "Creating Oracle directories ..."

sqlplus sys/${orapw} as sysdba <<-EOF >> $LOGFILE 

create or replace directory ${district_name^^}_ACT_OUT_DIR as '/home/edfi/data/${district_id}/ACT';
create or replace directory ${district_name^^}_AP_OUT_DIR as '/home/edfi/data/${district_id}/AP';
create or replace directory ${district_name^^}_IB_OUT_DIR as '/home/edfi/data/${district_id}/IB';
create or replace directory ${district_name^^}_SAT_OUT_DIR as '/home/edfi/data/${district_id}/SAT';
create or replace directory ${district_name^^}_TSI_OUT_DIR as '/home/edfi/data/${district_id}/TSI';
create or replace directory ${district_name^^}_TSI2_OUT_DIR as '/home/edfi/data/${district_id}/TSI2';

insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_ACT_OUT_DIR', sysdate, 'ACT');
insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_AP_OUT_DIR', sysdate, 'AP');
insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_IB_OUT_DIR', sysdate, 'IB');
insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_SAT_OUT_DIR', sysdate, 'SAT');
insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_TSI_OUT_DIR', sysdate, 'TSI');
insert into EDFIDATA.DISTRICT_OUTPUT_DIR values ('${district_id}', '${district_name^^}_TSI2_OUT_DIR', sysdate, 'TSI2');

commit;

GRANT READ, WRITE ON DIRECTORY ${district_name^^}_ACT_OUT_DIR TO EDFIDATA;
GRANT READ, WRITE ON DIRECTORY ${district_name^^}_AP_OUT_DIR TO EDFIDATA;
GRANT READ, WRITE ON DIRECTORY ${district_name^^}_IB_OUT_DIR TO EDFIDATA;
GRANT READ, WRITE ON DIRECTORY ${district_name^^}_SAT_OUT_DIR TO EDFIDATA;
GRANT READ, WRITE ON DIRECTORY ${district_name^^}_TSI_OUT_DIR TO EDFIDATA;
GRANT READ, WRITE ON DIRECTORY ${district_name^^}_TSI2_OUT_DIR TO EDFIDATA;

exit

EOF

echo " ok"

echo -n "Creating ODBC DSN ..."

if [[ ${district_id} == 0* ]]   # trim leading "0" if ${district_id} starts with a "0"
then
  distid=${district_id:1}
else
  distid=${district_id} 
fi

cp /etc/odbc.ini /etc/odbc.ini_$$ 2>>${LOGFILE}
cat /root/scripts/templates/odbc_template.ini | sed "s/##DISTRICT##/${district_name}/g" | sed "s/##DISTRICTID##/${district_id}/" | sed "s/##DISTID##/${distid}/" >> /etc/odbc.ini 2>>${LOGFILE}

echo " ok"

echo -n "Creating Oracle HS ..."

cat /root/scripts/templates/initedfi_template.ora | sed "s/##DISTRICT##/${district_name}/" > /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}.ora 2>>${LOGFILE}
cat /root/scripts/templates/initedfi_template_import.ora | sed "s/##DISTRICT##/${district_name}/" > /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}_import.ora 2>>${LOGFILE}
chmod 755 /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}.ora /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}_import.ora 2>>${LOGFILE}
chown oracle:dba /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}.ora /u01/app/oracle/12.1/db_1/hs/admin/initedfi_${district_name}_import.ora 2>>${LOGFILE}

echo " ok"

echo -n "Creating Oracle Listeners ..."

cp $TNS_HOME/listener.ora $TNS_HOME/listener.ora_$$ 2>>${LOGFILE}
cat /root/scripts/templates/listener_template.ora | sed "s/##DISTUPPER##/${district_name^^}/" | sed "s/##DISTRICT##/${district_name}/" | sed "s/##PORT1##/${port1}/" | sed "s/##PORT2##/${port2}/" >> $TNS_HOME/listener.ora 2>>${LOGFILE}
chmod 644 $TNS_HOME/listener.ora 2>>${LOGFILE}
chown oracle:dba $TNS_HOME/listener.ora 2>>${LOGFILE}

echo " ok"

echo -n "Creating Oracle TNS names ..."

cp $TNS_HOME/tnsnames.ora $TNS_HOME/tnsnames.ora_$$ 2>>${LOGFILE}
cat /root/scripts/templates/tnsnames_template.ora | sed "s/##DISTRICT##/${district_name}/g" | sed "s/##PORT1##/${port1}/" | sed "s/##PORT2##/${port2}/" >> $TNS_HOME/tnsnames.ora 2>>${LOGFILE}
chmod 644 $TNS_HOME/tnsnames.ora 2>>${LOGFILE}
chown oracle:dba $TNS_HOME/tnsnames.ora 2>>${LOGFILE}

echo " ok"

echo -n "Starting Oracle Listeners ..."

su - oracle -c "$TNS_BIN/lsnrctl start LISTENER_EDFI_${district_name^^}" >>${LOGFILE}
su - oracle -c "$TNS_BIN/lsnrctl start LISTENER_EDFI_${district_name^^}_IMPORT" >>${LOGFILE}

echo " ok"

echo -n "Creating Oracle dblinks ..."
sqlplus sys/${orapw} as sysdba <<-EOF >> $LOGFILE
  conn EDFIDATA/${edfidatapw}
  create database link EDFI_${district_name^^}.REGION10.ORG connect to EDFI_STATS identified by "${edfistatspw}" using 'edfi_${district_name}';
  create database link EDFI_${district_name^^}_IMPORT.REGION10.ORG connect to EDFI_STATS identified by "${edfistatspw}" using 'edfi_${district_name}_import';
  exit
EOF

echo " ok"

echo -n "Testing Oracle ODBC HS (Gateway) to ODS databases ..."
sqlplus sys/${orapw} as sysdba <<-EOF >> $LOGFILE
  conn EDFIDATA/${edfidatapw}
  select distinct('success') as status from edfi.Student@edfi_${district_name}.region10.org;
  select distinct('success') as status from dbo.Resources@edfi_${district_name}_import.region10.org;
  exit
EOF

echo " ok"

echo -n "Checking script log for errors ..."
if grep -qE 'ERROR|error|Error' ${LOGFILE}
then
  echo -n " warning ... "
  echo "errors found in log file ${LOGFILE}"
else 
  echo " ok"
fi

echo "Completed $0 ..."
exit 0

## TODO: ---------------------------------------------------------------------------------------
# - modify /etc/rc.d/init.d/listener.sh file for starting/stopping listeners on reboot by 
#   adding new LISTENERS created by this script to the file /etc/rc.d/init.d/listener.sh.
# - create SQL Server views v_Files and v_IngestionLogs -  see GitHub for code.
# - create SQL Server stored procedure sp_reset_agent - see GitHub for code.
#-----------------------------------------------------------------------------------------------
