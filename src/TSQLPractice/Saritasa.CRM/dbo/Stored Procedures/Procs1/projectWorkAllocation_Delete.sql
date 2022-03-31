
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectWorkAllocation table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_Delete]
(

	@WorkAllocationID int   
)
AS


				DELETE FROM [dbo].[ProjectWorkAllocation] WITH (ROWLOCK) 
				WHERE
					[workAllocationID] = @WorkAllocationID