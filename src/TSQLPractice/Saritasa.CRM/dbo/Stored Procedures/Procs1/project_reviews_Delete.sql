
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the project_reviews table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_Delete
(

	@ID int   
)
AS


				DELETE FROM [dbo].[project_reviews] WITH (ROWLOCK) 
				WHERE
					[ID] = @ID
					
			


