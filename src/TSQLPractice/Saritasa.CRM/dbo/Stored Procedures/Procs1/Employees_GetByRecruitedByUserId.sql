
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Employees table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_GetByRecruitedByUserId
(

	@RecruitedByUserId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[PreviousEmployment],
					[ContractSignedAt],
					[BranchId],
					[OnSite],
					[Comments],
					[Photo],
					[Score],
					[DailyReportNotRequired],
					[LastHrmContactAt],
					[IsPartTime],
					[BucketTaskId],
					[DefaultBucketJobText],
					[DefaultBucketTaskTitle],
					[RecruitedByUserId],
					[VendorId],
					[RecruitSourceId],
					[FirstWorkingDate],
					[LastWorkingDate],
					[IsIntern]
				FROM
					[dbo].[Employees]
				WHERE
					[RecruitedByUserId] = @RecruitedByUserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON