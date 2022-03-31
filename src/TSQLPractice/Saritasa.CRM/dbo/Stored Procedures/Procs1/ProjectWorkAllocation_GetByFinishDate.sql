
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectWorkAllocation table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectWorkAllocation_GetByFinishDate
(

	@FinishDate datetime   
)
AS


				SELECT
					[workAllocationID],
					[ProjectId],
					[WorkTypeId],
					[StartDate],
					[FinishDate],
					[Hours],
					[RepeatNextMonth],
					[MonthSelect],
					[Description],
					[CreatedBy],
					[CreatedTime],
					[ModifiedBy],
					[ModifiedTime],
					[RealisticHours]
				FROM
					[dbo].[ProjectWorkAllocation]
				WHERE
					[FinishDate] = @FinishDate
				SELECT @@ROWCOUNT