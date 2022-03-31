
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the UserNoteSettings table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[userNoteSettings_Insert]
(

	@SetID int    OUTPUT,

	@ContentType char (2)  ,

	@UserId int   ,

	@Type tinyint   
)
AS


				
				INSERT INTO [dbo].[UserNoteSettings]
					(
					[ContentType]
					,[UserId]
					,[Type]
					)
				VALUES
					(
					@ContentType
					,@UserId
					,@Type
					)
				
				-- Get the identity value
				SET @SetID = SCOPE_IDENTITY()