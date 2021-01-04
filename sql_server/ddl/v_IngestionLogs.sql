SQL to create views for master-detail report from ODS_Import database for load status and info
NOTE: Do one CREATE at a time, not both in same window/session within SQL Server Studio
==============================================================================================

USE [EdFi_Ods_Import_070912]  --< change database as needed
GO

create or alter view [dbo].[v_IngestionLogs]
as
SELECT [Id]
      ,[AgentId]
      ,SUBSTRING(CAST(FileName AS TEXT),1,100) as FileName
      ,CONVERT(VARCHAR(20), Date, 120) as Date
      ,SUBSTRING(CAST(RowNumber AS TEXT), 1, 10) as RowNumber
      ,SUBSTRING(CAST(HttpStatusCode AS TEXT), 1, 10) as HttpStatusCode
      ,SUBSTRING(CAST(OdsResponse AS TEXT), 1, 4000) as OdsResponse
FROM [dbo].[IngestionLogs];