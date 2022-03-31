
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Files table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_GetByTypeID]
(

	@TypeId char (2)  
)
AS


				SET ANSI_NULLS OFF
				
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
					[TypeId] = @TypeId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON