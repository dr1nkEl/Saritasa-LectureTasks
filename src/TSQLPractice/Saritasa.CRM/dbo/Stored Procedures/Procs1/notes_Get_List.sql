
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Notes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_Get_List]

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
					
				SELECT @@ROWCOUNT