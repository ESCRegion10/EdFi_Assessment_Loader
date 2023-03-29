create or replace package PKG_DISTRICTS is

  TYPE t_TABLE_CNT_row is record (
    "SchemaName"             varchar2(100), 
    "TableName"              varchar2(100), 
    "TotalRowCount"          integer
  );
  
  TYPE t_TABLE_CNT_tab IS TABLE OF t_TABLE_CNT_row;
--------------------------------------------------------------
-- create procedure for table DISTRICTS
   procedure INS_DISTRICTS (
      P_DISTRICT_CDC                  in varchar2,
      P_DISTRICT_NAME                 in varchar2,
      P_DISTRICT_DB_NUMBER            in varchar2,
      P_ACTIVE                        in varchar2                        default 'Y',
			P_API_KEY                       in varchar2,
      P_API_SECRET                    in varchar2,
      P_MASS_SEND_FLAG                in varchar2,
      P_ASVAB_FLAG                    in varchar2,
      P_MILITARY_ENLISTMENT_FLAG      in varchar2,
      P_MENINGITIS_VACCINATION_FLAG   in varchar2,
      P_ASSOCIATES_DEGREE_FLAG        in varchar2,
      P_COLLEGE_APP_FLAG              in varchar2,
      P_FINANCIAL_APP_FLAG            in varchar2,
			P_LEVEL_1_2_CERT_FLAG           in varchar2,
			P_INDUSTRY_CERT_FLAG            in varchar2,
			P_DUAL_CR_COURSE_FLAG           in varchar2,
			P_EDFI_VERSION                  in varchar2,
			P_SCHOOL_YEAR                   in varchar2,
			P_PROXY_DISTRICT_NAME           in varchar2
   );
--------------------------------------------------------------
-- update procedure for table DISTRICTS
   procedure UPD_DISTRICTS (
		  P_DISTRICT_SID                  in number,
      P_DISTRICT_CDC                  in varchar2,
      P_DISTRICT_NAME                 in varchar2,
      P_DISTRICT_DB_NUMBER            in varchar2,
      P_ACTIVE                        in varchar2                        default null,
			P_API_KEY                       in varchar2,
			P_API_SECRET                    in varchar2,
			P_MASS_SEND_FLAG                in varchar2,
			P_ASVAB_FLAG                    in varchar2,
			P_MILITARY_ENLISTMENT_FLAG      in varchar2,
			P_MENINGITIS_VACCINATION_FLAG   in varchar2,
			P_ASSOCIATES_DEGREE_FLAG        in varchar2,
			P_COLLEGE_APP_FLAG              in varchar2,
			P_FINANCIAL_APP_FLAG            in varchar2,
			P_LEVEL_1_2_CERT_FLAG           in varchar2,
			P_INDUSTRY_CERT_FLAG            in varchar2,
			P_DUAL_CR_COURSE_FLAG           in varchar2,
			P_EDFI_VERSION                  in varchar2,
			P_SCHOOL_YEAR                   in varchar2,
			P_PROXY_DISTRICT_NAME           in varchar2,
      P_MD5                           in varchar2                        default null
   );
--------------------------------------------------------------
-- delete procedure for table DISTRICTS
   procedure DEL_DISTRICTS (
      P_DISTRICT_SID in varchar2
   );
--------------------------------------------------------------
-- get procedure for table DISTRICTS
   procedure GET_DISTRICTS (
		  P_DISTRICT_SID       in number,
      P_DISTRICT_CDC       out varchar2,
      P_DISTRICT_NAME      out varchar2,
      P_DISTRICT_DB_NUMBER out varchar2,
      P_ACTIVE             out varchar2,
			P_API_KEY            out varchar2,
			P_API_SECRET        out varchar2,
      P_MD5                out varchar2
   );
--------------------------------------------------------------
-- build MD5 function for table DISTRICTS
   function BUILD_DISTRICTS_MD5 (
		  P_DISTRICT_SID       in number,
      P_DISTRICT_CDC       in varchar2,
      P_DISTRICT_NAME      in varchar2,
      P_DISTRICT_DB_NUMBER in varchar2,
      P_ACTIVE             in varchar2                        default null,
			P_API_KEY            in varchar2,
			P_API_SECRET        in varchar2
   ) return varchar2;
	 
-- function returns the districts db link
    function GET_DB_LINK (
			  P_DB_NUMBER in int) 
		return varchar2;
		
-- function returns sql for ods row counts		
 function GET_SQL_ODS_TABLE_COUNTS (
		 P_DB_NUMBER in int)
		 return varchar2;

-- pipelined table function to return table list with row counts.
  procedure CACHE_ODS_ROW_COUNTS (
			 P_ODS_NUMBER       in varchar2
  );
		 
end PKG_DISTRICTS;
/
create or replace package body PKG_DISTRICTS is
--------------------------------------------------------------
-- create procedure for table DISTRICTS
   procedure INS_DISTRICTS (
      P_DISTRICT_CDC                  in varchar2,
      P_DISTRICT_NAME                 in varchar2,
      P_DISTRICT_DB_NUMBER            in varchar2,
      P_ACTIVE                        in varchar2                        default 'Y',
			P_API_KEY                       in varchar2,
			P_API_SECRET                    in varchar2,
			P_MASS_SEND_FLAG                in varchar2,
			P_ASVAB_FLAG                    in varchar2,
			P_MILITARY_ENLISTMENT_FLAG      in varchar2,
			P_MENINGITIS_VACCINATION_FLAG   in varchar2,
			P_ASSOCIATES_DEGREE_FLAG        in varchar2,
			P_COLLEGE_APP_FLAG              in varchar2,
			P_FINANCIAL_APP_FLAG            in varchar2,
			P_LEVEL_1_2_CERT_FLAG           in varchar2,
			P_INDUSTRY_CERT_FLAG            in varchar2,
			P_DUAL_CR_COURSE_FLAG           in varchar2,
			P_EDFI_VERSION                  in varchar2,
			P_SCHOOL_YEAR                   in varchar2,
			P_PROXY_DISTRICT_NAME           in varchar2
   ) is 
 
   begin
 
      insert into DISTRICTS (
			   DISTRICT_SID,
         DISTRICT_CDC,
         DISTRICT_NAME,
         DISTRICT_DB_NUMBER,
         ACTIVE,
				 API_KEY,
				 API_SECRET,
				 MASS_SEND_FLAG,
				 ASVAB_FLAG,
				 MILITARY_ENLISTMENT_FLAG,
				 MENINGITIS_VACCINATION_FLAG,
				 ASSOCIATES_DEGREE_FLAG,
				 COLLEGE_APP_FLAG,
				 FINANCIAL_APP_FLAG,
				 LEVEL_1_2_CERT_FLAG,
				 INDUSTRY_CERT_FLAG,
				 DUAL_CR_COURSE_FLAG,
				 EDFI_VERSION,
				 SCHOOL_YEAR,
				 PROXY_DISTRICT_NAME
      ) values ( 
			   SID_SEQUENCE.NEXTVAL,
         P_DISTRICT_CDC,
         P_DISTRICT_NAME,
         P_DISTRICT_DB_NUMBER,
         P_ACTIVE,
				 P_API_KEY,
         P_API_SECRET,
				 P_MASS_SEND_FLAG,
	 			 P_ASVAB_FLAG,
	 			 P_MILITARY_ENLISTMENT_FLAG,
				 P_MENINGITIS_VACCINATION_FLAG,
				 P_ASSOCIATES_DEGREE_FLAG,
				 P_COLLEGE_APP_FLAG,
				 P_FINANCIAL_APP_FLAG,
				 P_LEVEL_1_2_CERT_FLAG,
				 P_INDUSTRY_CERT_FLAG,
				 P_DUAL_CR_COURSE_FLAG,
				 P_EDFI_VERSION,
         P_SCHOOL_YEAR,
				 P_PROXY_DISTRICT_NAME
      );
 
   end INS_DISTRICTS;
--------------------------------------------------------------
-- update procedure for table DISTRICTS
   procedure UPD_DISTRICTS (
		  P_DISTRICT_SID                  in number,
      P_DISTRICT_CDC                  in varchar2,
      P_DISTRICT_NAME                 in varchar2,
      P_DISTRICT_DB_NUMBER            in varchar2,
      P_ACTIVE                        in varchar2                        default null,
			P_API_KEY                       in varchar2,
			P_API_SECRET                    in varchar2,
			P_MASS_SEND_FLAG                in varchar2,
			P_ASVAB_FLAG                    in varchar2,
			P_MILITARY_ENLISTMENT_FLAG      in varchar2,
			P_MENINGITIS_VACCINATION_FLAG   in varchar2,
			P_ASSOCIATES_DEGREE_FLAG        in varchar2,
			P_COLLEGE_APP_FLAG              in varchar2,
			P_FINANCIAL_APP_FLAG            in varchar2,
			P_LEVEL_1_2_CERT_FLAG           in varchar2,
			P_INDUSTRY_CERT_FLAG            in varchar2,
			P_DUAL_CR_COURSE_FLAG           in varchar2,
			P_EDFI_VERSION                  in varchar2,
			P_SCHOOL_YEAR                   in varchar2,
			P_PROXY_DISTRICT_NAME           in varchar2,
      P_MD5                           in varchar2                        default null
   ) is 
 
      L_MD5 varchar2(32767) := null;
 
   begin
 
      if P_MD5 is not null then
         for c1 in (
            select * from DISTRICTS 
            where DISTRICT_SID = P_DISTRICT_SID FOR UPDATE
         ) loop
 
            L_MD5 := BUILD_DISTRICTS_MD5(
						   c1.DISTRICT_SID,
               c1.DISTRICT_CDC,
               c1.DISTRICT_NAME,
               c1.DISTRICT_DB_NUMBER,
               c1.ACTIVE,
							 C1.API_KEY,
							 c1.API_SECRET
            );
 
         end loop;
 
      end if;
 
      if (P_MD5 is null) or (L_MD5 = P_MD5) then 
         update DISTRICTS set
				    DISTRICT_CDC                   = P_DISTRICT_CDC,
            DISTRICT_NAME                  = P_DISTRICT_NAME,
            DISTRICT_DB_NUMBER             = P_DISTRICT_DB_NUMBER,
            ACTIVE                         = P_ACTIVE,
						API_KEY                        = P_API_KEY,
			      API_SECRET                     = P_API_SECRET,
						MASS_SEND_FLAG                 = P_MASS_SEND_FLAG,
            ASVAB_FLAG                     = P_ASVAB_FLAG,
            MILITARY_ENLISTMENT_FLAG       = P_MILITARY_ENLISTMENT_FLAG,
            MENINGITIS_VACCINATION_FLAG    = P_MENINGITIS_VACCINATION_FLAG,
            ASSOCIATES_DEGREE_FLAG         = P_ASSOCIATES_DEGREE_FLAG,
            COLLEGE_APP_FLAG               = P_COLLEGE_APP_FLAG,
            FINANCIAL_APP_FLAG             = P_FINANCIAL_APP_FLAG,
            LEVEL_1_2_CERT_FLAG            = P_LEVEL_1_2_CERT_FLAG,
            INDUSTRY_CERT_FLAG             = P_INDUSTRY_CERT_FLAG,
            DUAL_CR_COURSE_FLAG            = P_DUAL_CR_COURSE_FLAG,
						EDFI_VERSION                   = P_EDFI_VERSION,
            SCHOOL_YEAR                    = P_SCHOOL_YEAR,
						PROXY_DISTRICT_NAME            = P_PROXY_DISTRICT_NAME
         where DISTRICT_SID = P_DISTRICT_SID;
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');  
      end if;
 
   end UPD_DISTRICTS;
--------------------------------------------------------------
-- delete procedure for table DISTRICTS
   procedure DEL_DISTRICTS (
      P_DISTRICT_SID in varchar2
   ) is 
 
   begin
 
      delete from DISTRICTS 
      where DISTRICT_SID = P_DISTRICT_SID;
 
   end DEL_DISTRICTS;
--------------------------------------------------------------
-- get procedure for table DISTRICTS
   procedure GET_DISTRICTS (
		  P_DISTRICT_SID       in number,
      P_DISTRICT_CDC       out varchar2,
      P_DISTRICT_NAME      out varchar2,
      P_DISTRICT_DB_NUMBER out varchar2,
      P_ACTIVE             out varchar2,
			P_API_KEY            out varchar2,
			P_API_SECRET        out varchar2,
      P_MD5                out varchar2
   ) is 
 
   begin
 
      for c1 in (
         select * from DISTRICTS 
         where DISTRICT_SID = P_DISTRICT_SID 
      ) loop
			   P_DISTRICT_CDC       := c1.DISTRICT_CDC;
         P_DISTRICT_NAME      := c1.DISTRICT_NAME;
         P_DISTRICT_DB_NUMBER := c1.DISTRICT_DB_NUMBER;
         P_ACTIVE             := c1.ACTIVE;
				 P_API_KEY            := c1.API_KEY;
         P_API_SECRET        := c1.API_SECRET;
 
         P_MD5 := BUILD_DISTRICTS_MD5(
				    c1.DISTRICT_SID,
            c1.DISTRICT_CDC,
            c1.DISTRICT_NAME,
            c1.DISTRICT_DB_NUMBER,
            c1.ACTIVE,
					  c1.API_KEY,
					  c1.API_SECRET
         );
      end loop;
 
   end GET_DISTRICTS;
--------------------------------------------------------------
-- build MD5 function for table DISTRICTS
   function BUILD_DISTRICTS_MD5 (
		  P_DISTRICT_SID       in number,
      P_DISTRICT_CDC       in varchar2,
      P_DISTRICT_NAME      in varchar2,
      P_DISTRICT_DB_NUMBER in varchar2,
      P_ACTIVE             in varchar2                        default null,
			P_API_KEY            in varchar2,
			P_API_SECRET        in varchar2
   ) return varchar2 is 
 
   begin
 
      return apex_util.get_hash(apex_t_varchar2(
			   P_DISTRICT_SID,
			   P_DISTRICT_CDC,
         P_DISTRICT_NAME,
         P_DISTRICT_DB_NUMBER,
         P_ACTIVE,
				 P_API_KEY,
				 P_API_SECRET ));
 
   end BUILD_DISTRICTS_MD5;
 -- function returns the districts db link
    function GET_DB_LINK (
			  P_DB_NUMBER in int) 
		return varchar2 is
		l_db_link varchar2(100);
		begin
			select DB_LINK
        into l_db_link
        from DISTRICTS 
				join DISTRICT_DB_LINK_SY on DISTRICT_DB_LINK_SY.DISTRICT_ID = DISTRICTS.DISTRICT_CDC
       where DISTRICTS.DISTRICT_DB_NUMBER = P_DB_NUMBER
         and TARGET_DB = 'ODS'
				 and DISTRICTS.SCHOOL_YEAR = DISTRICT_DB_LINK_SY.SCHOOL_YEAR
				 and DISTRICTS.PRIMARY_SCHOOL_YEAR = 'Y';
		  return l_db_link;
		exception 
			when no_data_found then
				return null;
		end GET_DB_LINK;
-- function returns sql for ods row counts
   function GET_SQL_ODS_TABLE_COUNTS (
		 P_DB_NUMBER in int)
		 return varchar2 is
		 l_db_link varchar2(100);
		 begin
			 l_db_link := GET_DB_LINK(P_DB_NUMBER);
			 if l_db_link is not null then
				 return 'select schemas."name" AS "SchemaName",
                    "Tables"."name" AS "TableName",
                    SUM("Partitions"."rows") AS "TotalRowCount"
                  FROM sys."tables"@'||l_db_link||' "Tables"
                  JOIN sys."partitions"@'||l_db_link||' "Partitions" ON "Tables"."object_id" = "Partitions"."object_id"
                                      AND "Partitions"."index_id" IN ( 0, 1 )
									join sys."schemas"@'||l_db_link||' schemas on schemas."schema_id" = "Tables"."schema_id"
                  where schemas."name" = ''edfi''
                      and "Tables"."name" not like ''Type''
                    and "Tables"."name" not like ''Descriptor''
                  GROUP BY schemas."name", "Tables"."name"';
			else
				return null;
			end if;
		 end GET_SQL_ODS_TABLE_COUNTS;
		 
-- pipelined table function to return table list with row counts.
  procedure CACHE_ODS_ROW_COUNTS (
			 P_ODS_NUMBER       in varchar2
  ) as
	
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
  begin
		-- CLEAR THE TMP TABLE
			delete from ods_table_cnt_cache
				where session_id = nv('APP_SESSION')
				  or CREATE_TS < sysdate -5; 
		-- GET DB-LINK		
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK_SY DB
				join districts D on D.DISTRICT_CDC = DB.DISTRICT_ID
				     and D.DISTRICT_DB_NUMBER = P_ODS_NUMBER
						 and D.PRIMARY_SCHOOL_YEAR = 'Y'
						 and D.SCHOOL_YEAR = DB.SCHOOL_YEAR
			 where TARGET_DB = 'ODS';
				 
		l_sql := 'insert into ods_table_cnt_cache
								 select '||nv('APP_SESSION')||' AS SESSION_ID,
											 SYSTIMESTAMP AS CREATE_TS,
											 schemas."name" AS Schema_Name,
											"Tables"."name" AS Table_Name,
											SUM("Partitions"."rows") AS Row_Count
										FROM sys."tables"@'||l_db_link||' "Tables"
										JOIN sys."partitions"@'||l_db_link||' "Partitions" ON "Tables"."object_id" = "Partitions"."object_id"
																				AND "Partitions"."index_id" IN ( 0, 1 )
										join sys."schemas"@'||l_db_link||' schemas on schemas."schema_id" = "Tables"."schema_id"
										where schemas."name" = ''edfi''
												and "Tables"."name" not like ''Type''
											and "Tables"."name" not like ''Descriptor''
										GROUP BY schemas."name", "Tables"."name"';
		DBMS_OUTPUT.PUT_LINE(l_sql);			 
		-- RUN SQL			 
		execute immediate l_sql;
		-- COMMIT THE INSERT AND COMMIT THE DB_LINK
		commit;
		-- CLOSE THE DB_LINK
		execute immediate 'alter session close database link ' || l_db_link;
	exception
		when no_data_found then
			delete from ods_table_cnt_cache
			where session_id = v('APP_SESSION');
		when others then
			raise;
  end CACHE_ODS_ROW_COUNTS;
	
end PKG_DISTRICTS;
/
