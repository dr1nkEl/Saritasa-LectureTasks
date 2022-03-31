
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the UserNoteSettings table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_GetByContentType]
(

	@ContentType char (2)  
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
					[ContentType] = @ContentType
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON