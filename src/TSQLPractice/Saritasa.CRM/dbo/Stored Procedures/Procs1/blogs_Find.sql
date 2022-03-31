
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Blogs table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_Find]
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@UserId int   = null ,

	@CreatedAt datetime   = null ,

	@Title varchar (200)  = null ,

	@Text varchar (MAX)  = null ,

	@CommentBlogId int   = null ,

	@ParentCommentId int   = null ,

	@RemovedAt datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [UserId]
	, [CreatedAt]
	, [Title]
	, [Text]
	, [CommentBlogId]
	, [ParentCommentId]
	, [RemovedAt]
    FROM
	[dbo].[Blogs]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([CreatedAt] = @CreatedAt OR @CreatedAt IS NULL)
	AND ([Title] = @Title OR @Title IS NULL)
	AND ([Text] = @Text OR @Text IS NULL)
	AND ([CommentBlogId] = @CommentBlogId OR @CommentBlogId IS NULL)
	AND ([ParentCommentId] = @ParentCommentId OR @ParentCommentId IS NULL)
	AND ([RemovedAt] = @RemovedAt OR @RemovedAt IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [UserId]
	, [CreatedAt]
	, [Title]
	, [Text]
	, [CommentBlogId]
	, [ParentCommentId]
	, [RemovedAt]
    FROM
	[dbo].[Blogs]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([CreatedAt] = @CreatedAt AND @CreatedAt is not null)
	OR ([Title] = @Title AND @Title is not null)
	OR ([Text] = @Text AND @Text is not null)
	OR ([CommentBlogId] = @CommentBlogId AND @CommentBlogId is not null)
	OR ([ParentCommentId] = @ParentCommentId AND @ParentCommentId is not null)
	OR ([RemovedAt] = @RemovedAt AND @RemovedAt is not null)
	SELECT @@ROWCOUNT			
  END