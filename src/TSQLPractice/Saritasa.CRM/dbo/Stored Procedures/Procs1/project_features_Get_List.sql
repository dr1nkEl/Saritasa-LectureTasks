
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the project_features table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_Get_List

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
					
				SELECT @@ROWCOUNT
			


