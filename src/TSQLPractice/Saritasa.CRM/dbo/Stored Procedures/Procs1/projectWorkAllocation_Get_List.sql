
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectWorkAllocation table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_Get_List]

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
					
				SELECT @@ROWCOUNT