
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the FileFolders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_Get_List]

AS


				
				SELECT
					[folderID],
					[ProjectId],
					[Name]
				FROM
					[dbo].[FileFolders]
					
				SELECT @@ROWCOUNT