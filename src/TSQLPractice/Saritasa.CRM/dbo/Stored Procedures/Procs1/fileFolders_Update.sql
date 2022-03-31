
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the FileFolders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_Update]
(

	@FolderID int   ,

	@ProjectId int   ,

	@Name varchar (200)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[FileFolders]
				SET
					[ProjectId] = @ProjectId
					,[Name] = @Name
				WHERE
[folderID] = @FolderID