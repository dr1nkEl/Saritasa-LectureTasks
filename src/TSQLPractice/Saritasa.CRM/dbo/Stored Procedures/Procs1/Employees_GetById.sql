
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Employees table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_GetById
(

	@Id int   
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
					[LastWorkingDate],
					[IsIntern]
				FROM
					[dbo].[Employees]
				WHERE
					[Id] = @Id
				SELECT @@ROWCOUNT