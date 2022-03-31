
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the project_sprints table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_Get_List

AS


				
				SELECT
					[ID],
					[documentID],
					[projectID],
					[name],
					[limit],
					[startDate],
					[finishDate],
					[description]
				FROM
					[dbo].[project_sprints]
					
				SELECT @@ROWCOUNT
			


