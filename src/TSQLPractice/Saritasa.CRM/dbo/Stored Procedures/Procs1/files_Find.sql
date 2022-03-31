
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Files table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[files_Find]
(

	@SearchUsingOR bit   = null ,

	@FileID int   = null ,

	@GroupKey char (10)  = null ,

	@Description varchar (MAX)  = null ,

	@FileSize bigint   = null ,

	@FilePath varchar (MAX)  = null ,

	@FileMime char (100)  = null ,

	@UniqueKey uniqueidentifier   = null ,

	@FileName varchar (500)  = null ,

	@DocumentId bigint   = null ,

	@TargetId bigint   = null ,

	@TypeId char (2)  = null ,

	@FolderId int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [fileID]
	, [GroupKey]
	, [Description]
	, [FileSize]
	, [FilePath]
	, [FileMime]
	, [UniqueKey]
	, [FileName]
	, [DocumentId]
	, [TargetId]
	, [TypeId]
	, [FolderId]
    FROM
	[dbo].[Files]
    WHERE 
	 ([fileID] = @FileID OR @FileID IS NULL)
	AND ([GroupKey] = @GroupKey OR @GroupKey IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([FileSize] = @FileSize OR @FileSize IS NULL)
	AND ([FilePath] = @FilePath OR @FilePath IS NULL)
	AND ([FileMime] = @FileMime OR @FileMime IS NULL)
	AND ([UniqueKey] = @UniqueKey OR @UniqueKey IS NULL)
	AND ([FileName] = @FileName OR @FileName IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([FolderId] = @FolderId OR @FolderId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [fileID]
	, [GroupKey]
	, [Description]
	, [FileSize]
	, [FilePath]
	, [FileMime]
	, [UniqueKey]
	, [FileName]
	, [DocumentId]
	, [TargetId]
	, [TypeId]
	, [FolderId]
    FROM
	[dbo].[Files]
    WHERE 
	 ([fileID] = @FileID AND @FileID is not null)
	OR ([GroupKey] = @GroupKey AND @GroupKey is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([FileSize] = @FileSize AND @FileSize is not null)
	OR ([FilePath] = @FilePath AND @FilePath is not null)
	OR ([FileMime] = @FileMime AND @FileMime is not null)
	OR ([UniqueKey] = @UniqueKey AND @UniqueKey is not null)
	OR ([FileName] = @FileName AND @FileName is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([FolderId] = @FolderId AND @FolderId is not null)
	SELECT @@ROWCOUNT			
  END