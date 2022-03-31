
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the project_reviews table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_Get_List

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
					
				SELECT @@ROWCOUNT
			


