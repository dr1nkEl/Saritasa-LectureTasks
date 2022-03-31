
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Notes table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_Find]
(

	@SearchUsingOR bit   = null ,

	@NoteID bigint   = null ,

	@ParentNoteId bigint   = null ,

	@NoteText varchar (MAX)  = null ,

	@TypeId char (2)  = null ,

	@DocumentId bigint   = null ,

	@TargetId bigint   = null ,

	@ShowClient bit   = null ,

	@NeedAnswer bit   = null ,

	@Viewed bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [noteID]
	, [ParentNoteId]
	, [NoteText]
	, [TypeId]
	, [DocumentId]
	, [TargetId]
	, [ShowClient]
	, [NeedAnswer]
	, [Viewed]
    FROM
	[dbo].[Notes]
    WHERE 
	 ([noteID] = @NoteID OR @NoteID IS NULL)
	AND ([ParentNoteId] = @ParentNoteId OR @ParentNoteId IS NULL)
	AND ([NoteText] = @NoteText OR @NoteText IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([DocumentId] = @DocumentId OR @DocumentId IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([ShowClient] = @ShowClient OR @ShowClient IS NULL)
	AND ([NeedAnswer] = @NeedAnswer OR @NeedAnswer IS NULL)
	AND ([Viewed] = @Viewed OR @Viewed IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [noteID]
	, [ParentNoteId]
	, [NoteText]
	, [TypeId]
	, [DocumentId]
	, [TargetId]
	, [ShowClient]
	, [NeedAnswer]
	, [Viewed]
    FROM
	[dbo].[Notes]
    WHERE 
	 ([noteID] = @NoteID AND @NoteID is not null)
	OR ([ParentNoteId] = @ParentNoteId AND @ParentNoteId is not null)
	OR ([NoteText] = @NoteText AND @NoteText is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([DocumentId] = @DocumentId AND @DocumentId is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([ShowClient] = @ShowClient AND @ShowClient is not null)
	OR ([NeedAnswer] = @NeedAnswer AND @NeedAnswer is not null)
	OR ([Viewed] = @Viewed AND @Viewed is not null)
	SELECT @@ROWCOUNT			
  END