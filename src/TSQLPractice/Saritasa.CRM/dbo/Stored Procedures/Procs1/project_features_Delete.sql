
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the project_features table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_Delete
(

	@ID int   
)
AS


				DELETE FROM [dbo].[project_features] WITH (ROWLOCK) 
				WHERE
					[ID] = @ID
					
			


