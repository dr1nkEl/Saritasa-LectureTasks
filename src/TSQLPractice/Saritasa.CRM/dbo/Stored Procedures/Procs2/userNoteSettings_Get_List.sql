
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the UserNoteSettings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_Get_List]

AS


				
				SELECT
					[setID],
					[ContentType],
					[UserId],
					[Type]
				FROM
					[dbo].[UserNoteSettings]
					
				SELECT @@ROWCOUNT