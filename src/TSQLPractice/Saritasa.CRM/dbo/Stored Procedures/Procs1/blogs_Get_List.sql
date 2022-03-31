
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Blogs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[blogs_Get_List]

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
					
				SELECT @@ROWCOUNT