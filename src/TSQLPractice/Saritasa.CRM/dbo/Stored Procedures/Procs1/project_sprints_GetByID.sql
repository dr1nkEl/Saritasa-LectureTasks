
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_sprints table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_GetByID
(

	@ID int   
)
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
				WHERE
					[ID] = @ID
				SELECT @@ROWCOUNT
					
			


