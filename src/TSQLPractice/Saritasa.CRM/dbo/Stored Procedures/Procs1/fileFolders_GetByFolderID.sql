
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the FileFolders table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_GetByFolderID]
(

	@FolderID int   
)
AS


				SELECT
					[folderID],
					[ProjectId],
					[Name]
				FROM
					[dbo].[FileFolders]
				WHERE
					[folderID] = @FolderID
				SELECT @@ROWCOUNT