
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Blogs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_Insert]
(

	@Id int    OUTPUT,

	@UserId int   ,

	@CreatedAt datetime   ,

	@Title varchar (200)  ,

	@Text varchar (MAX)  ,

	@CommentBlogId int   ,

	@ParentCommentId int   ,

	@RemovedAt datetime   
)
AS


				
				INSERT INTO [dbo].[Blogs]
					(
					[UserId]
					,[CreatedAt]
					,[Title]
					,[Text]
					,[CommentBlogId]
					,[ParentCommentId]
					,[RemovedAt]
					)
				VALUES
					(
					@UserId
					,@CreatedAt
					,@Title
					,@Text
					,@CommentBlogId
					,@ParentCommentId
					,@RemovedAt
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()