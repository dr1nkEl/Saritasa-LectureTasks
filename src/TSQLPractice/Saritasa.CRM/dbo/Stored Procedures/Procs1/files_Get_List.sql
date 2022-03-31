
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Files table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_Get_List]

AS


				
				SELECT
					[fileID],
					[GroupKey],
					[Description],
					[FileSize],
					[FilePath],
					[FileMime],
					[UniqueKey],
					[FileName],
					[DocumentId],
					[TargetId],
					[TypeId],
					[FolderId]
				FROM
					[dbo].[Files]
					
				SELECT @@ROWCOUNT