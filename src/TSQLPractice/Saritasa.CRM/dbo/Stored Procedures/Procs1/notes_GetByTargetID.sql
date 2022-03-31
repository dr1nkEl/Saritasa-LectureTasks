
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notes table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_GetByTargetID]
(

	@TargetId bigint   
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
					[TargetId] = @TargetId
				SELECT @@ROWCOUNT