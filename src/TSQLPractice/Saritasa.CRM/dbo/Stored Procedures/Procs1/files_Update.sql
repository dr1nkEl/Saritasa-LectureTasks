
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Files table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_Update]
(

	@FileID int   ,

	@GroupKey char (10)  ,

	@Description varchar (MAX)  ,

	@FileSize bigint   ,

	@FilePath varchar (MAX)  ,

	@FileMime char (100)  ,

	@UniqueKey uniqueidentifier   ,

	@FileName varchar (500)  ,

	@DocumentId bigint   ,

	@TargetId bigint   ,

	@TypeId char (2)  ,

	@FolderId int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Files]
				SET
					[GroupKey] = @GroupKey
					,[Description] = @Description
					,[FileSize] = @FileSize
					,[FilePath] = @FilePath
					,[FileMime] = @FileMime
					,[UniqueKey] = @UniqueKey
					,[FileName] = @FileName
					,[DocumentId] = @DocumentId
					,[TargetId] = @TargetId
					,[TypeId] = @TypeId
					,[FolderId] = @FolderId
				WHERE
[fileID] = @FileID