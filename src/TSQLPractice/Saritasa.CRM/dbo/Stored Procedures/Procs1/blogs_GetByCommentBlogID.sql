
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Blogs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_GetByCommentBlogID]
(

	@CommentBlogId int   
)
AS


				SELECT
					[Id],
					[UserId],
					[CreatedAt],
					[Title],
					[Text],
					[CommentBlogId],
					[ParentCommentId],
					[RemovedAt]
				FROM
					[dbo].[Blogs]
				WHERE
					[CommentBlogId] = @CommentBlogId
				SELECT @@ROWCOUNT