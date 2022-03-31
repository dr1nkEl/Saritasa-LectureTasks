
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Employees table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_Get_List

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
					
				SELECT @@ROWCOUNT