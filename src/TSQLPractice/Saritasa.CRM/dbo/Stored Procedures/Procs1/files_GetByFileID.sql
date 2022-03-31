
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Files table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_GetByFileID]
(

	@FileID int   
)
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
				WHERE
					[fileID] = @FileID
				SELECT @@ROWCOUNT