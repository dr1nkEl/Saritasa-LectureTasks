
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_features table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_GetByID
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
					[description]
				FROM
					[dbo].[project_features]
				WHERE
					[ID] = @ID
				SELECT @@ROWCOUNT
					
			


