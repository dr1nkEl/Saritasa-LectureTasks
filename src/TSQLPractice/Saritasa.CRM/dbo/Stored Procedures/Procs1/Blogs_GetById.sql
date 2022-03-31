
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Blogs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Blogs_GetById
(

	@Id int   
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
					[Id] = @Id
				SELECT @@ROWCOUNT