
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Blogs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_Update]
(

	@Id int   ,

	@UserId int   ,

	@CreatedAt datetime   ,

	@Title varchar (200)  ,

	@Text varchar (MAX)  ,

	@CommentBlogId int   ,

	@ParentCommentId int   ,

	@RemovedAt datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Blogs]
				SET
					[UserId] = @UserId
					,[CreatedAt] = @CreatedAt
					,[Title] = @Title
					,[Text] = @Text
					,[CommentBlogId] = @CommentBlogId
					,[ParentCommentId] = @ParentCommentId
					,[RemovedAt] = @RemovedAt
				WHERE
[Id] = @Id