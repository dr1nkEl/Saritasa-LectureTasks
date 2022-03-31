
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ChatMembers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chatMembers_Update]
(

	@Id int   ,

	@ChatId int   ,

	@UserId int   ,

	@Closed bit   ,

	@ViewedTextLength int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ChatMembers]
				SET
					[ChatId] = @ChatId
					,[UserId] = @UserId
					,[Closed] = @Closed
					,[ViewedTextLength] = @ViewedTextLength
				WHERE
[Id] = @Id