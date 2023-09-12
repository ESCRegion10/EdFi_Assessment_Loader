create or replace package PKG_CCMR_ADMIN is
--------------------------------------------------------------
-- create procedure for table "DISTRICT_PROGRAM_OF_STUDY"
-----------------------------------------------------------------
   procedure INS_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_ID         in number,
      P_PROGRAM_OF_STUDY_SID in number,
			P_SCHOOL_YEAR          in varchar2
   );
---------------------------------------------------------------
-- delete procedure for table "DISTRICT_PROGRAM_OF_STUDY"
-- DELETES ALL PROGRAMS OF STUDY FOR A SPECIFIC SCHOOL YEAR AND DISTRICT
-----------------------------------------------------------------
  procedure DEL_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_SID in number,
			P_PROGRAM_OF_STUDY_SID  in number
   );
--------------------------------------------------------------
-- Ccpy procedure for table "DISTRICT_PROGRAM_OF_STUDY" from prior school year
-----------------------------------------------------------------
   procedure COPY_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_ID          in varchar2,
      P_SCHOOL_YEAR          in varchar2  -- current school year to load
   );
end PKG_CCMR_ADMIN;
/
create or replace package body PKG_CCMR_ADMIN is
--------------------------------------------------------------
-- create procedure for table "DISTRICT_PROGRAM_OF_STUDY"
-----------------------------------------------------------------
   procedure INS_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_ID         in number,
      P_PROGRAM_OF_STUDY_SID in number,
			P_SCHOOL_YEAR          in varchar2
   ) is 
 
   l_district_sid number;

   begin
		  -- get the district_sid for the input school year
      select district_sid
				into l_district_sid
				from v_districts
				where district_cdc = P_DISTRICT_ID
				and school_year = P_SCHOOL_YEAR;
				
      insert into DISTRICT_PROGRAM_OF_STUDY (
         DISTRICT_SID,
         PROGRAM_OF_STUDY_SID
      ) values ( 
         l_district_sid,
         P_PROGRAM_OF_STUDY_SID
      );
 
   end INS_DISTRICT_PROGRAM_OF_STUDY;
---------------------------------------------------------------
-- delete procedure for table "DISTRICT_PROGRAM_OF_STUDY"
-- DELETES ALL PROGRAMS OF STUDY FOR A SPECIFIC SCHOOL YEAR AND DISTRICT
-----------------------------------------------------------------
   procedure DEL_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_SID in number,
			P_PROGRAM_OF_STUDY_SID  in number
   ) is 
 
   begin
 
      delete from DISTRICT_PROGRAM_OF_STUDY 
      where DISTRICT_SID = P_DISTRICT_SID 
			and PROGRAM_OF_STUDY_SID = P_PROGRAM_OF_STUDY_SID;
 
   end DEL_DISTRICT_PROGRAM_OF_STUDY;
--------------------------------------------------------------
-- Ccpy procedure for table "DISTRICT_PROGRAM_OF_STUDY" from prior school year
-----------------------------------------------------------------
   procedure COPY_DISTRICT_PROGRAM_OF_STUDY (
      P_DISTRICT_ID          in varchar2,
      P_SCHOOL_YEAR          in varchar2  -- current school year to load
   ) is 
   
	 type t_prog_code is table of varchar2(100) index by pls_integer;
	 l_prog_code t_prog_code;
	 l_to_district_sid number;
	 l_from_district_sid number;
   begin
		 -- get the district_sid for the target school year
      select district_sid
				into l_to_district_sid
				from v_districts
				where district_cdc = P_DISTRICT_ID
				and school_year = P_SCHOOL_YEAR;
	  -- get the district_sid for the source school year
      select district_sid
				into l_from_district_sid
				from v_districts
				where district_cdc = P_DISTRICT_ID
				and school_year = P_SCHOOL_YEAR - 1;
	 
	 -- get the program codes to copy
      select PROGRAM_CODE
			  bulk collect into l_prog_code
				from PROGRAM_OF_STUDY P 
				join DISTRICT_PROGRAM_OF_STUDY dp 
				  on dp.DISTRICT_SID = l_from_district_sid
					and dp.PROGRAM_OF_STUDY_SID = p.PROGRAM_OF_STUDY_SID
			 where SCHOOL_YEAR = P_SCHOOL_YEAR - 1;
																		 
			for i in l_prog_code.first..l_prog_code.last loop
				begin
					insert into DISTRICT_PROGRAM_OF_STUDY 
						(district_sid, PROGRAM_OF_STUDY_SID)
						select l_to_district_sid,
									 PROGRAM_OF_STUDY_SID
							from PROGRAM_OF_STUDY
						 where school_year = p_school_year
							 and l_prog_code(i) = program_code;
				exception
					when dup_val_on_index then
						null;
				end;
			end loop;
 
   end COPY_DISTRICT_PROGRAM_OF_STUDY;
 
end PKG_CCMR_ADMIN;
/
