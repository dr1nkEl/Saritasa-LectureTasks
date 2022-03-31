
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notes table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_GetByTypeID]
(

	@TypeId char (2)  
)
AS


				SELECT
					[noteID],
					[ParentNoteId],
					[NoteText],
					[TypeId],
					[DocumentId],
					[TargetId],
					[ShowClient],
					[NeedAnswer],
					[Viewed]
				FROM
					[dbo].[Notes]
				WHERE
					[TypeId] = @TypeId
				SELECT @@ROWCOUNT