
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectPriority table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_Delete]
(

	@PriorityID int   
)
AS


				DELETE FROM [dbo].[ProjectPriority] WITH (ROWLOCK) 
				WHERE
					[priorityID] = @PriorityID