
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the project_features_resources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_Delete
(

	@ID int   
)
AS


				DELETE FROM [dbo].[project_features_resources] WITH (ROWLOCK) 
				WHERE
					[ID] = @ID
					
			


