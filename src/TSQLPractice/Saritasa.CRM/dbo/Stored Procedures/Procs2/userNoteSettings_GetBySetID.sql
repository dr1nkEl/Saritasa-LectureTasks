
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the UserNoteSettings table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_GetBySetID]
(

	@SetID int   
)
AS


				SELECT
					[setID],
					[ContentType],
					[UserId],
					[Type]
				FROM
					[dbo].[UserNoteSettings]
				WHERE
					[setID] = @SetID
				SELECT @@ROWCOUNT