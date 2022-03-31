
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the FileFolders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_Delete]
(

	@FolderID int   
)
AS


				DELETE FROM [dbo].[FileFolders] WITH (ROWLOCK) 
				WHERE
					[folderID] = @FolderID