
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectWorkAllocation table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_GetByModifiedBy]
(

	@ModifiedBy int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[ModifiedBy] = @ModifiedBy
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON