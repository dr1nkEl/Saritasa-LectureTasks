
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_sprints table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_GetByProjectID
(

	@ProjectID int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[projectID] = @ProjectID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


