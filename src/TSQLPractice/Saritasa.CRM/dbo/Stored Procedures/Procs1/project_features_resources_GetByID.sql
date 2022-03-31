
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_features_resources table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_GetByID
(

	@ID int   
)
AS


				SELECT
					[ID],
					[projectFeatureID],
					[userID],
					[role]
				FROM
					[dbo].[project_features_resources]
				WHERE
					[ID] = @ID
				SELECT @@ROWCOUNT
					
			


