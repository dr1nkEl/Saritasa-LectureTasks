
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the UserNoteSettings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_Delete]
(

	@SetID int   
)
AS


				DELETE FROM [dbo].[UserNoteSettings] WITH (ROWLOCK) 
				WHERE
					[setID] = @SetID