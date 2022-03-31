
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Notes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_Insert]
(

	@NoteID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[Notes]
					(
					[ParentNoteId]
					,[NoteText]
					,[TypeId]
					,[DocumentId]
					,[TargetId]
					,[ShowClient]
					,[NeedAnswer]
					,[Viewed]
					)
				VALUES
					(
					@ParentNoteId
					,@NoteText
					,@TypeId
					,@DocumentId
					,@TargetId
					,@ShowClient
					,@NeedAnswer
					,@Viewed
					)
				
				-- Get the identity value
				SET @NoteID = SCOPE_IDENTITY()