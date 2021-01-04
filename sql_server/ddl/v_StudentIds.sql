USE [EdFi_2021_Ods_255902]  --< change database as needed
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create or alter view [edfi].[v_StudentIds] as
select
[FirstName],
[LastSurname],
[BirthDate],
[StudentUniqueId],
[IdentificationCode] as [LocalCode]
from [edfi].[Student]
left join [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] on [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode].StudentUSI = [edfi].[Student].StudentUSI
     and [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode].AssigningOrganizationIdentificationCode = 'District';
GO