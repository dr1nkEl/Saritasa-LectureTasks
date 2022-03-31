
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectPriority table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_GetByPriorityID]
(

	@PriorityID int   
)
AS


				SELECT
					[priorityID],
					[Name],
					[Color]
				FROM
					[dbo].[ProjectPriority]
				WHERE
					[priorityID] = @PriorityID
				SELECT @@ROWCOUNT