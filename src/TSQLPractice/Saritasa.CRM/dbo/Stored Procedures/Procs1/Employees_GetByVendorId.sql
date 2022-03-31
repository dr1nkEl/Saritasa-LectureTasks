
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Employees table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_GetByVendorId
(

	@VendorId int   
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
					[VendorId] = @VendorId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON