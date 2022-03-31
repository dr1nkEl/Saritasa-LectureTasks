
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_Get_List]

AS


				
				SELECT
					[tagID],
					[Title]
				FROM
					[dbo].[Tags]
					
				SELECT @@ROWCOUNT