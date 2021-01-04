-- run as EDFIDATA

-- Create database link for cedar hill
create database link EDFI_CEDAR_HILL.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_cedar_hill';

-- Create database link for cedar hill import
create database link EDFI_CEDAR_HILL_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_cedar_hill_import';

----------

-- Create database link for duncanville
create database link EDFI_DUNCANVILLE.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_duncanville';

-- Create database link for duncanville import
create database link EDFI_DUNCANVILLE_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_duncanville_import';
  
----------

-- Create database link for grand prairie
create database link EDFI_GRANDPRAIRIE.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_grandprairie';

-- Create database link for grand prairie import
create database link EDFI_GRANDPRAIRIE_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_grandprairie_import';
  
----------

-- Create database link for richardson
create database link EDFI_RICHARDSON.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_richardson';

-- Create database link for richardson import
create database link EDFI_RICHARDSON_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_richardson_import';
  
------------

 -- Create database link for forney
create database link EDFI_FORNEY.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_forney';

-- Create database link for forney import
create database link EDFI_FORNEY_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_forney_import';
 
------------

create database link EDFI_WAXAHACHIE.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_waxahachie';
  
create database link EDFI_WAXAHACHIE_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_waxahachie_import';  

------------

create database link EDFI_FERRIS.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_ferris';
  
create database link EDFI_FERRIS_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_ferris_import';
  
------------

-- Create database link for garland
create database link EDFI_GARLAND.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_garland';

-- Create database link for garland import
create database link EDFI_GARLAND_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_garland_import';

------------

-- Create database link for stephenville
create database link EDFI_STEPHENVILLE.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_stephenville';
 
-- Create database link for stephenville import
create database link EDFI_STEPHENVILLE_IMPORT.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi_stephenville_import';

------------

-- Create database link for edfi25
create database link EDFI25.REGION10.ORG
  connect to EDFI_STATS identified by "C33c!a8Qz*Y$"
  using 'edfi25';
  
