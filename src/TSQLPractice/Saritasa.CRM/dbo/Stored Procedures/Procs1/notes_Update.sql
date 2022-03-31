
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Notes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_Update]
(

	@NoteID bigint   ,

	@ParentNoteId bigint   ,

	@NoteText varchar (MAX)  ,

	@TypeId char (2)  ,

	@DocumentId bigint   ,

	@TargetId bigint   ,

	@ShowClient bit   ,

	@NeedAnswer bit   ,

	@Viewed bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Notes]
				SET
					[ParentNoteId] = @ParentNoteId
					,[NoteText] = @NoteText
					,[TypeId] = @TypeId
					,[DocumentId] = @DocumentId
					,[TargetId] = @TargetId
					,[ShowClient] = @ShowClient
					,[NeedAnswer] = @NeedAnswer
					,[Viewed] = @Viewed
				WHERE
[noteID] = @NoteID