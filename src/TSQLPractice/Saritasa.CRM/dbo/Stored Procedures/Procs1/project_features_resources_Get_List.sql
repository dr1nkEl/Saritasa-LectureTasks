
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the project_features_resources table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_resources_Get_List

AS


				
				SELECT
					[ID],
					[projectFeatureID],
					[userID],
					[role]
				FROM
					[dbo].[project_features_resources]
					
				SELECT @@ROWCOUNT
			


