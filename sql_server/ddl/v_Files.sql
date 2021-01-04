SQL to create views for master-detail report from ODS_Import database for load status and info
NOTE: Do one CREATE at a time, not both in same window/session within SQL Server Studio
==============================================================================================

USE [EdFi_Ods_Import_070912]  --< change database as needed
GO

create or alter view [dbo].[v_Files]
as
SELECT [Id]
      ,[AgentId]
      ,SUBSTRING(CAST(FileName AS TEXT),1,100) as FileName
      ,Status
      ,SUBSTRING(CAST(Message AS TEXT),1,300) as Message
      ,Rows
      ,CONVERT(VARCHAR(20), CreateDate, 120) as CreateDate
  FROM [dbo].[Files];