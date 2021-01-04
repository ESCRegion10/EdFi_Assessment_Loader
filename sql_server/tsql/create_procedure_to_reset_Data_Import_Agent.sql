-------------
- Reset Agent
-------------
USE [EdFi_Ods_Import_070905]  --< change database as needed
GO

-- Reset Agent
CREATE or ALTER PROCEDURE [dbo].[sp_reset_agent]
AS
begin
  update [dbo].[Agents] --< change database as needed
  set LastExecuted = null;
end;
--exec sp_reset_agent