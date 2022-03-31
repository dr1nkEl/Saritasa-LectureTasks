
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ChatMembers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_Insert]
(

	@Id int    OUTPUT,

	@ChatId int   ,

	@UserId int   ,

	@Closed bit   ,

	@ViewedTextLength int   
)
AS


				
				INSERT INTO [dbo].[ChatMembers]
					(
					[ChatId]
					,[UserId]
					,[Closed]
					,[ViewedTextLength]
					)
				VALUES
					(
					@ChatId
					,@UserId
					,@Closed
					,@ViewedTextLength
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()