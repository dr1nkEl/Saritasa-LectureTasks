
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectWorkAllocation table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_GetByWorkAllocationID]
(

	@WorkAllocationID int   
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
					[workAllocationID] = @WorkAllocationID
				SELECT @@ROWCOUNT