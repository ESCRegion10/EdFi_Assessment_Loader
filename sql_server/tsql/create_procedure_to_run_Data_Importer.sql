--------------
- Run Importer
--------------
USE [EdFi_Ods_Import_070905]  --< change database as needed
GO

EXEC sp_configure 'show advanced options', 1;
GO
Reconfigure;
GO

EXEC sp_configure 'xp_cmdshell', 1
GO
Reconfigure
GO
--Msg 229, Level 14, State 5, Procedure master..xp_cmdshell, Line 1 [Batch Start Line 31]
--The EXECUTE permission was denied on the object 'xp_cmdshell', database 'mssqlsystemresource', schema 'sys'.

--should get the following status messages:
--Configuration option 'show advanced options' changed from 0 to 1. Run the RECONFIGURE statement to install.
--Configuration option 'xp_cmdshell' changed from 0 to 1. Run the RECONFIGURE statement to install.
