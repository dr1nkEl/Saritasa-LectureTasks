
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Chat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_Update]
(

	@Id int   ,

	@LastCommentBy int   ,

	@Text varchar (MAX)  ,

	@Top int   ,

	@Left int   ,

	@Minimize bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Chat]
				SET
					[LastCommentBy] = @LastCommentBy
					,[Text] = @Text
					,[Top] = @Top
					,[Left] = @Left
					,[Minimize] = @Minimize
				WHERE
[Id] = @Id