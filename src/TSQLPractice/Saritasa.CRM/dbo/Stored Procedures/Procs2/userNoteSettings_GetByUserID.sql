
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the UserNoteSettings table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_GetByUserID]
(

	@UserId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[setID],
					[ContentType],
					[UserId],
					[Type]
				FROM
					[dbo].[UserNoteSettings]
				WHERE
					[UserId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON