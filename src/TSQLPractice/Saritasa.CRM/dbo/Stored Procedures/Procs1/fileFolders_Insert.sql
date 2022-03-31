
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the FileFolders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_Insert]
(

	@FolderID int    OUTPUT,

	@ProjectId int   ,

	@Name varchar (200)  
)
AS


				
				INSERT INTO [dbo].[FileFolders]
					(
					[ProjectId]
					,[Name]
					)
				VALUES
					(
					@ProjectId
					,@Name
					)
				
				-- Get the identity value
				SET @FolderID = SCOPE_IDENTITY()