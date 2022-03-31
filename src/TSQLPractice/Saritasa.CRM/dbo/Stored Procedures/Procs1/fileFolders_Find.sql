
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the FileFolders table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_Find]
(

	@SearchUsingOR bit   = null ,

	@FolderID int   = null ,

	@ProjectId int   = null ,

	@Name varchar (200)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [folderID]
	, [ProjectId]
	, [Name]
    FROM
	[dbo].[FileFolders]
    WHERE 
	 ([folderID] = @FolderID OR @FolderID IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [folderID]
	, [ProjectId]
	, [Name]
    FROM
	[dbo].[FileFolders]
    WHERE 
	 ([folderID] = @FolderID AND @FolderID is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([Name] = @Name AND @Name is not null)
	SELECT @@ROWCOUNT			
  END