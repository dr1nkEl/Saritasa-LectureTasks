
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectResources view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectResources_Get_List

AS


				
				SELECT
					[Id],
					[UserId],
					[ProjectId],
					[WorkTypeId],
					[WorkTypeName],
					[CreatedAt],
					[CreatedByUserId],
					[ProjectDepartmentId],
					[ProjectDepartmentName],
					[FirstName],
					[LastName],
					[UserTitle],
					[UserFullName],
					[UserEmailId],
					[UserEmail],
					[UserDocumentId],
					[UserTypeId],
					[StartDate],
					[ProposedFinishDate],
					[DevelopmentSite],
					[ActualSite],
					[ActualFinishDate],
					[Description],
					[ProjectName],
					[ParentProjectId],
					[Notes],
					[ProjectDocumentId],
					[ClientId],
					[UserBirthday],
					[UserTimeZone],
					[Billable],
					[DurationLimit],
					[UserStatusId],
					[CurrentMonthJobsMinutes],
					[PreviousMonthJobsMinutes],
					[IsDedicated],
					[UpdatedAt],
					[UpdatedByUserId]
				FROM
					[dbo].[_vProjectResources]
					
				SELECT @@ROWCOUNT