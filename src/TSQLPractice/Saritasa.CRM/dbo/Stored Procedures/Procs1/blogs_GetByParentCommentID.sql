
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Blogs table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_GetByParentCommentID]
(

	@ParentCommentId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[ParentCommentId] = @ParentCommentId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON