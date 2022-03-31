
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectPriority table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_Get_List]

AS


				
				SELECT
					[priorityID],
					[Name],
					[Color]
				FROM
					[dbo].[ProjectPriority]
					
				SELECT @@ROWCOUNT