
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Employees table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_GetByUserId
(

	@UserId int   
)
AS


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
					[LastWorkingDate]
				FROM
					[dbo].[Employees]
				SELECT @@ROWCOUNT