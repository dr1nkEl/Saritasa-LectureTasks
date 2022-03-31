
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Notes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notes_Delete]
(

	@NoteID bigint   
)
AS


				DELETE FROM [dbo].[Notes] WITH (ROWLOCK) 
				WHERE
					[noteID] = @NoteID