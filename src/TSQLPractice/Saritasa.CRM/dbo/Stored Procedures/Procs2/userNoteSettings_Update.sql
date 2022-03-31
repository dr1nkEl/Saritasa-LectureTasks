
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the UserNoteSettings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_Update]
(

	@SetID int   ,

	@ContentType char (2)  ,

	@UserId int   ,

	@Type tinyint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[UserNoteSettings]
				SET
					[ContentType] = @ContentType
					,[UserId] = @UserId
					,[Type] = @Type
				WHERE
[setID] = @SetID