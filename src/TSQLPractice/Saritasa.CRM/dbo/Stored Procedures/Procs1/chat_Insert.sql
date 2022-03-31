
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Chat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[chat_Insert]
(

	@Id int    OUTPUT,

	@LastCommentBy int   ,

	@Text varchar (MAX)  ,

	@Top int   ,

	@Left int   ,

	@Minimize bit   
)
AS


				
				INSERT INTO [dbo].[Chat]
					(
					[LastCommentBy]
					,[Text]
					,[Top]
					,[Left]
					,[Minimize]
					)
				VALUES
					(
					@LastCommentBy
					,@Text
					,@Top
					,@Left
					,@Minimize
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()