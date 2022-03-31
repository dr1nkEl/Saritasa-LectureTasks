
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_reviews table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_GetByID
(

	@ID int   
)
AS


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
					[ID] = @ID
				SELECT @@ROWCOUNT
					
			


