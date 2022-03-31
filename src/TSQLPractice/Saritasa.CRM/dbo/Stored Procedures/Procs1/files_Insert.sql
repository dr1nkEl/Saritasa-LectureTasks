
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Files table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_Insert]
(

	@FileID int    OUTPUT,

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


				
				INSERT INTO [dbo].[Files]
					(
					[GroupKey]
					,[Description]
					,[FileSize]
					,[FilePath]
					,[FileMime]
					,[UniqueKey]
					,[FileName]
					,[DocumentId]
					,[TargetId]
					,[TypeId]
					,[FolderId]
					)
				VALUES
					(
					@GroupKey
					,@Description
					,@FileSize
					,@FilePath
					,@FileMime
					,@UniqueKey
					,@FileName
					,@DocumentId
					,@TargetId
					,@TypeId
					,@FolderId
					)
				
				-- Get the identity value
				SET @FileID = SCOPE_IDENTITY()