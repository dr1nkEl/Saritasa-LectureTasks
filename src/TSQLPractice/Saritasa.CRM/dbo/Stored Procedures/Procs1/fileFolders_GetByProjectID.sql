
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the FileFolders table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[fileFolders_GetByProjectID]
(

	@ProjectId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[folderID],
					[ProjectId],
					[Name]
				FROM
					[dbo].[FileFolders]
				WHERE
					[ProjectId] = @ProjectId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON