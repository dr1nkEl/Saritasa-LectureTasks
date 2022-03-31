
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_reviews table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_GetByProjectID
(

	@ProjectID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ID],
					[projectID],
					[name],
					[scheduledDate],
					[createdBy],
					[created],
					[reviewTo],
					[reviewedBy],
					[reviewDate],
					[updatedBy],
					[updated],
					[rating],
					[comment]
				FROM
					[dbo].[project_reviews]
				WHERE
					[projectID] = @ProjectID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


